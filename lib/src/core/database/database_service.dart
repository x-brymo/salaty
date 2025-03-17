import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaty/src/core/error/error_code.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../error/failures.dart';
import '../util/constants.dart';
import '../util/model/dua.dart';
import '../util/model/quran.dart';
import '../util/model/tasbih.dart';
import 'database_table.dart';

class DatabaseService {
  /// **Checks if the database exists in local storage**
  Future<bool> checkIfDatabaseExist() async {
    final databasesPath = await getDatabasesPath();
    final pathName = join(databasesPath, DATABASE_FILE);
    return File(pathName).exists();
  }

  /// **Initializes the database from assets without downloading**
  Future<Either<LocalFailure, Database>> initService(BuildContext context) async {
    try {
      final databasesPath = await getDatabasesPath();
      final pathName = join(databasesPath, DATABASE_FILE);

      // If database does not exist, copy it from assets
      if (!await checkIfDatabaseExist()) {
        ByteData data = await rootBundle.load('assets/db/db.db');
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(pathName).writeAsBytes(bytes, flush: true);
      }

      // Open the database
      final Database db = await openDatabase(pathName);

      // Cache data if needed
      await DatabaseTable.cachedDataFromDb(db, context);

      return Right(db);
    } catch (e) {
      return Left(LocalFailure(message: 'Failed to initialize database: $e',
       error: 500,
       
       ));
    }
  }

  /// **Splits Quran data into chunks**
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

  /// **Toggle Favorite for Tasbih**
  Future<List<Map<String, Object?>>> toggleTasbihFavorite(Database db, Tasbih tasbih) async {
    await db.rawUpdate(
      'UPDATE tasbih SET favorite = NOT favorite WHERE id = ?',
      [tasbih.id],
    );
    return await db.query('tasbih');
  }

  /// **Create Tasbih**
  Future<List<Map<String, Object?>>> createTasbih(Database db, Map<String, Object> details) async {
    final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT id FROM tasbih ORDER BY id DESC LIMIT 1')) ?? 0;

    if (details.containsKey('name') && details.containsKey('counter')) {
      await db.rawInsert(
          'INSERT INTO tasbih(id, name, counter, favorite) VALUES(?, ?, ?, ?)',
          [count + 1, details['name'].toString(), details['counter'] as int, 0]);
    }
    return await db.query('tasbih');
  }

  /// **Edit Tasbih**
  Future<List<Map<String, Object?>>> editTasbih(Database db, Tasbih tasbih, Map<String, Object> details) async {
    if (details.containsKey('name')) {
      await db.rawUpdate(
        'UPDATE tasbih SET name = ? WHERE id = ?',
        [details['name'].toString(), tasbih.id],
      );
    }
    if (details.containsKey('counter')) {
      await db.rawUpdate(
        'UPDATE tasbih SET counter = ? WHERE id = ?',
        [details['counter'] as int, tasbih.id],
      );
    }
    return await db.query('tasbih');
  }

  /// **Delete Tasbih**
  Future<List<Map<String, Object?>>> deleteTasbih(Database db, Tasbih tasbih) async {
    await db.rawDelete('DELETE FROM tasbih WHERE id = ?', [tasbih.id]);
    return await db.query('tasbih');
  }

  /// **Toggle Favorite for Dua**
  Future<List<Map<String, Object?>>> toggleDuaFavorite(Database db, Dua dua) async {
    await db.rawUpdate(
      'UPDATE dua SET favorite = NOT favorite WHERE id = ?',
      [dua.id],
    );
    return await db.query('dua');
  }

  /// **Toggle Favorite for Quran**
  Future<List<Map<String, Object?>>> toggleQuranFavorite(Database db, Quran quran) async {
    await db.rawUpdate(
      'UPDATE quran SET favourite = NOT favourite WHERE ayatId = ?',
      [quran.ayatId],
    );
    return await splitQuranQuery(db);
  }
}
