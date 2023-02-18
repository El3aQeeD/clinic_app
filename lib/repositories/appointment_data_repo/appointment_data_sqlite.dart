import 'package:clinic_app/main.dart';
import 'package:clinic_app/models/appointment_data.dart';
import 'package:clinic_app/repositories/appointment_data_repo/appointment_data.dart';
import 'package:clinic_app/sqlite/crud.dart';


class AppointmentDataSqlite extends AppointmentDataRepository{
  @override
  Future<List<AppointmentData>> getAppointmentData() async{

    List<AppointmentData> appointmentDataList = [];
    try {


      List response = await SqliteDB().readData("select * from 'appointment' where user_id=${sharedPref.get('userId')}")  ;
      print(response);
      if(response.isNotEmpty) {
        appointmentDataList =
            response.map((appointmentData) => AppointmentData.fromJson(appointmentData)).toList();
      }
      else
      {
        print("app-data-sql");
      }

    }catch(exception){
      print(exception);

    }

    return appointmentDataList;

  }

  @override
  Future<int> insertAppointmentData({required var doctorName, required var doctorSpecialty , required var data,required var time }) async{

    int appointmentResponse = await SqliteDB().insertData("INSERT INTO 'appointment'('doctor_name','user_id','doctor_specialty','Data','Time') VALUES('${doctorName}','${sharedPref.get('userId')}','${doctorSpecialty}','${data}','${time}')");

    return appointmentResponse;
  }

  @override
  Future<int> deleteAppointmentData({required var id})async{
    int appointmentResponse = await SqliteDB().deleteData("delete from 'appointment' where id=${id}");
    return appointmentResponse;
  }
}
