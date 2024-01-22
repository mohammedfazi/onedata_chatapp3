
import 'package:sqflite/sqflite.dart';
import 'db_connection_job.dart';

class Repositoryjob{

  late DatabaseConnectionjob databaseConnectionjob;

  Repositoryjob(){
    databaseConnectionjob=DatabaseConnectionjob();
}
  static Database ? _database;
  Future<Database?> get database async{
    if(_database !=null){
      return _database;
    }else{
      _database=await databaseConnectionjob.setDatabase();
      return _database;
    }
  }
  ///insert user
  insertData(table,data)async{
    var connection=await database;
    return await connection?.insert(table, data);
  }

  ///read data
  readdata(table)async{
    var connection=await database;
    return await connection?.query(table);
  }

  ///update user
  updateData(table,data) async{
    var connection=await database;
    return await connection?.update(table, data,where: 'id=?',whereArgs: [data['id']]);
  }

  ///delete user
  deleteDataById(table,itemId)async{
    var connection=await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}