import 'package:sqflite/sqflite.dart';
import 'package:sqflite_local_db_demo_flutter/local_db/db_service.dart';


class TodoDB{

  final tableName="todos";

  Future<void> createTable(Database database) async{
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
     "title" TEXT NOT NULL,
     "created_at" INTEGER NOT NULL DEFAULT(cast(steftime('%s','now') as int,
     "updated_ad" INTEGER,
     PRIMARY KEY("id" AUTOINCREMENT)
     """);
  }

  Future<int> create({required String title}) async{
    final database =await DataBaseService().database;
    return await database.rawInsert('''
    INSERT INTO $tableName(title,created_at) VALUES (?,?)
    ''',
      [title,DateTime.now().microsecondsSinceEpoch]
    );
  }


}