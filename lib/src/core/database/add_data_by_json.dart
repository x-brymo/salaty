import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';


class AddDataByJson {

Future<void> addDataByJson(Database db) async {
  await insertTasbihFromJson(db);
  await insertDuaFromJson(db);
  await insertQuranFromJson(db);
}
  Future<void> insertTasbihFromJson(Database db) async {
  final String response = await rootBundle.loadString('assets/tasbih.json');
  final List<dynamic> tasbihData = json.decode(response);

  for (var tasbih in tasbihData) {
    await db.insert(
      'tasbih',
      {
        'tasbihId': tasbih['tasbih_id'],
        'title': tasbih['title'],
        'count': tasbih['count'],
        'favourite': 0
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> insertDuaFromJson(Database db) async {
  
  final String response = await rootBundle.loadString('assets/dua.json');
  final List<dynamic> duaData = json.decode(response);

  for (var dua in duaData) {
    await db.insert(
      'dua',
      {
        'duaId': dua['dua_id'],
        'title': dua['title'],
        'translation': dua['translation'],
        'favourite': 0
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
Future<void> insertQuranFromJson(Database db) async {
  final String response = await rootBundle.loadString('assets/quran.json');
  final List<dynamic> quranData = json.decode(response);

  for (var ayah in quranData) {
    await db.insert(
      'quran',
      {
        'ayatId': ayah['ayah_id'],
        'surahId': ayah['surah_id'],
        'text': ayah['text'],
        'translation': ayah['translation'],
        'favourite': 0
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    
  }
}

}