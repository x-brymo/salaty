import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/download/bloc/percent/percent_bloc.dart';
import '../error/error_code.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../network/network_client.dart';
import '../util/constants.dart';
import '../util/model/dua.dart';
import '../util/model/quran.dart';
import '../util/model/tasbih.dart';

class DatabaseService {
  Future<bool> checkIfDatabaseExist() async {
    final databasesPath = await getDatabasesPath();
    final pathName = '$databasesPath/$DATABASE_FILE';

    return await File(pathName).exists();
  }

  Future<Either<LocalFailure, Database>> initService(
      BuildContext context) async {
        
 await copyDatabaseFromAssets(); 
  final databasesPath = await getDatabasesPath();
  final pathName = '$databasesPath/siratemustaqeem-db.db';

  return Right(await openDatabase(pathName));

    // try {
    //   final databasesPath = await getDatabasesPath();
    //   final pathName = '$databasesPath/$DATABASE_FILE';

    //   final Database db = await openDatabase(pathName);

    //   await DatabaseTable.cachedDataFromDb(db, context);

    //   return Right(db);
    // } on LocalException catch (e) {
    //   return Left(
    //     LocalFailure(
    //       message: kReadDatabaseFailed['message'],
    //       error: kReadDatabaseFailed['errorCode'] as int,
    //       extraInfo: e.error,
    //     ),
    //   );
    // } catch (e) {
    //   return Left(
    //     LocalFailure(
    //       message: kReadDatabaseFailed['message'],
    //       error: kReadDatabaseFailed['errorCode'] as int,
    //       extraInfo: e.toString(),
    //     ),
    //   );
    // }
    
  }
  Future<void> copyDatabaseFromAssets() async {
  final databasesPath = await getDatabasesPath();
  final pathName = '$databasesPath/db.db';
  if (await File(pathName).exists()) return;
  ByteData data = await rootBundle.load('assets/db/db.db');
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(pathName).writeAsBytes(bytes);
}


  Future<List<Map<String, Object?>>> splitQuranQuery(Database db) async {
    final List<Map<String, Object?>> finalQurans = [];

    for (int i = 1; i <= 4; i++) {
      List<Map<String, Object?>> qurans = await db.rawQuery(
        'SELECT * FROM quran WHERE ayatId <= ${i * 2000} AND ayatId > ${(i - 1) * 2000}',
      );
      finalQurans.addAll(qurans);
    }

    return finalQurans;
  }

  Future<Either<Failure, Database>> downloadDatabase(
      BuildContext context) async {
    final databasesPath = await getDatabasesPath();
    final pathName = '$databasesPath/$DATABASE_FILE';

    try {
      final response = await NetworkClient(DATABASE_URL).download(
        'siratemustaqeem-db.db',
        pathName,
        (received, total) {
          if (total != -1) {
            final progress = received / total * 100;
            BlocProvider.of<PercentBloc>(context).add(
              UpdatePercent(progress),
            );
          }
        },
      );

      if (response.statusCode == 200) {
        var result = await initService(context);

        LocalFailure? localFailure;
        Database? database;

        result.fold(
          (l) => localFailure = l,
          (r) => database = r,
        );

        if (localFailure != null) {
          return Left(localFailure!);
        }
        return Right(database!);
      } else {
        return Left(
          RemoteFailure(
              message: response.statusCode,
              errorType: DioExceptionType.badResponse),
        );
      }
    } on RemoteException catch (e) {
      String? errorMessage = e.dioError.message;
      int? errorCode;

      for (final error in RemoteErrorCode.remoteErrors) {
        if (e.dioError.message!.contains(error['rawMessage'].toString())) {
          errorMessage = error['message'].toString();
          errorCode = error['errorCode'] as int;
        }
      }

      print(errorMessage);

      // Use local database file from assets if download fails
      try {
        ByteData data = await rootBundle.load('assets/db/db.db');
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(pathName).writeAsBytes(bytes);

        var result = await initService(context);

        LocalFailure? localFailure;
        Database? database;

        result.fold(
          (l) => localFailure = l,
          (r) => database = r,
        );

        if (localFailure != null) {
          return Left(localFailure!);
        }
        return Right(database!);
      } catch (e) {
        return Left(
          RemoteFailure(
            message: errorMessage,
            errorType: DioExceptionType.badResponse,
            errorCode: errorCode,
          ),
        );
      }
    }
  }

  Future<List<Map<String, Object?>>> toggleTasbihFavorite(
      Database db, Tasbih tasbih) async {
    List<Map> selectedTasbih =
        await db.rawQuery('SELECT * FROM tasbih WHERE id = ?', [tasbih.id]);

    if (selectedTasbih[0]['favorite'] == 0) {
      await db.rawUpdate(
        'UPDATE tasbih SET favorite = ? WHERE id = ?',
        [1, tasbih.id],
      );
    } else {
      await db.rawUpdate(
        'UPDATE tasbih SET favorite = ? WHERE id = ?',
        [0, tasbih.id],
      );
    }

    List<Map<String, Object?>> tasbihs = await db.query('tasbih');

    return tasbihs;
  }

  Future<List<Map<String, Object?>>> createTasbih(
      Database db, Map<String, Object> details) async {
    final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT id FROM tasbih ORDER BY id DESC LIMIT 1'));

    if (details.containsKey('name') && details.containsKey('counter')) {
      await db.rawInsert(
          'INSERT INTO tasbih(id, name,counter, favorite) VALUES(?, ?, ?, ?)', [
        (count! + 1),
        details['name'].toString(),
        details['counter'] as int,
        0
      ]);
    }

    List<Map<String, Object?>> tasbihs = await db.query('tasbih');

    return tasbihs;
  }

  Future<List<Map<String, Object?>>> editTasbih(
      Database db, Tasbih tasbih, Map<String, Object> details) async {
    if (details.containsKey('name') && details.containsKey('counter')) {
      await db.rawUpdate(
        'UPDATE tasbih SET name = ?, counter = ? WHERE id = ?',
        [details['name'].toString(), details['counter'] as int, tasbih.id],
      );
    } else if (details.containsKey('name')) {
      await db.rawUpdate(
        'UPDATE tasbih SET name = ? WHERE id = ?',
        [details['name'].toString(), tasbih.id],
      );
    } else if (details.containsKey('counter')) {
      await db.rawUpdate(
        'UPDATE tasbih SET counter = ? WHERE id = ?',
        [details['counter'] as int, tasbih.id],
      );
    }

    List<Map<String, Object?>> tasbihs = await db.query('tasbih');

    return tasbihs;
  }

  Future<List<Map<String, Object?>>> deleteTasbih(
      Database db, Tasbih tasbih) async {
    await db.rawDelete('DELETE FROM tasbih WHERE id = ?', [tasbih.id]);

    List<Map<String, Object?>> tasbihs = await db.query('tasbih');

    return tasbihs;
  }

  Future<List<Map<String, Object?>>> toggleDuaFavorite(
      Database db, Dua dua) async {
    List<Map> selectedDua =
        await db.rawQuery('SELECT * FROM dua WHERE id = ?', [dua.id]);

    if (selectedDua[0]['favorite'] == 0) {
      await db.rawUpdate(
        'UPDATE dua SET favorite = ? WHERE id = ?',
        [1, dua.id],
      );
    } else {
      await db.rawUpdate(
        'UPDATE dua SET favorite = ? WHERE id = ?',
        [0, dua.id],
      );
    }

    List<Map<String, Object?>> duas = await db.query('dua');

    return duas;
  }

  Future<List<Map<String, Object?>>> toggleQuranFavorite(
      Database db, Quran quran) async {
    List<Map> selectedQuran = await db
        .rawQuery('SELECT * FROM quran WHERE ayatId = ?', [quran.ayatId]);

    if (selectedQuran[0]['favourite'] == 0) {
      await db.rawUpdate(
        'UPDATE quran SET favourite = ? WHERE ayatId = ?',
        [1, quran.ayatId],
      );
    } else {
      await db.rawUpdate(
        'UPDATE quran SET favourite = ? WHERE ayatId = ?',
        [0, quran.ayatId],
      );
    }

    List<Map<String, Object?>> qurans =
        await DatabaseService().splitQuranQuery(db);

    return qurans;
  }
}
