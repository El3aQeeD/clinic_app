import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
class SqliteDB{

  static Database? _db ;

  // check if we have data base or not

  Future<Database?> get db async{
    if(_db==null)
    {
      _db= await intialDb();
      return _db;
    }
    else
    {
      return _db;
    }
  }

  //end of check

  //create data base

  intialDb() async{

    var dataBasePath= await getDatabasesPath();
    String path= join(dataBasePath,"clinic_app_data.db");
    Database myDb=await openDatabase(path, onCreate: _onCreate,version: 1,onUpgrade: _onUpgrade);
    return myDb;
  }

  //end of create data base

  //onUpgrade function
  _onUpgrade(Database db,int oldVersion,int newVersion) async{
    print("Onupgrade ===========");
  }

  //Create The data base table

  _onCreate(Database db,int version) async{
    await db.execute('''
      CREATE TABLE "appointment" (
      "id" integer primary key,
      "user_id" integer not null,
      "doctor_name" text not null,
      "doctor_specialty" text not null,
      "Data" text not null,
      "Time" text not null
      )
    ''');
    print("Table Created succssfully ================");
  }

// end of Create The data base table

  //SELECT

   readData(String sql) async
  {
    Database? myDB= await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  //INSERT

  insertData(String sql) async
  {
    Database? myDB= await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  //DELETE

  deleteData(String sql) async
  {
    Database? myDB= await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

  //UPDATE

  updateData(String sql) async
  {
    Database? mydb= await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

}