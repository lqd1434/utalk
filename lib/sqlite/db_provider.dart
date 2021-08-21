// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DBProvider {
//   static final DBProvider _singleton = DBProvider._internal();
//
//   factory DBProvider() {
//     return _singleton;
//   }
//
//   DBProvider._internal();
//
//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await _initDB();
//     return _db;
//   }
//
//   Future<Database> _initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = String.join(documentsDirectory.path, 'dbName');
//     return await openDatabase(path,
//         version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
//   }
//
//   ///
//   /// 创建Table
//   ///
//   Future _onCreate(Database db, int version) async {}
//
//   ///
//   /// 更新Table
//   ///
//   Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}
// }}
