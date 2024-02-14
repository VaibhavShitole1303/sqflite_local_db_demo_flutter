
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DataBaseService{
  Database? _dataBase;

  Future<Database> get database async{
    if(_dataBase != null){
      return _dataBase!;
    }
    _dataBase=await _initialize();
    return _dataBase!;
  }

  Future<String> get fullPath async{
    const name ="todo.db";
    final path=await getDatabasesPath();
    return join(path,name);
    }


  Future<Database > _initialize() async{
    final path=await fullPath;
    var database=await openDatabase(path,
    version: 1,
    onCreate: create,
    singleInstance: true,);
    return database;
  }

  Future<void> create(Database database,int version) async{
    await TodoDB().createTable(database);
  }
}