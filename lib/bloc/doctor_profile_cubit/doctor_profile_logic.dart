import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_state.dart';
import 'package:clinic_app/models/doctor_data.dart';
import 'package:clinic_app/models/doctor_schedule.dart';
import 'package:clinic_app/repositories/appointment_data_repo/appointment_data_sqlite.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_repository.dart';



class DoctorProfileCubit extends Cubit<DoctorProfileState>{
  DoctorProfileRepository? doctorProfileRepository;
  DoctorProfileCubit({this.doctorProfileRepository}):super(DoctorProfileInitial());
  late List<DoctorData> response;
  late List<DoctorSchedule> response2;
  bool isLoading=false;

  DoctorProfileCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }
Future <void> checkDoctorProfileState({required String id}) async{
    emit(DoctorProfileLoading());

    isLoading = true;
    response=await DoctorProfileApi().getDoctorData(id: id);

    if(response.isNotEmpty)
      {
        print("ohhhhh");
        response2=await DoctorProfileApi().getDoctorSchedule(id: id);
        emit(DoctorProfileSuccess());
        isLoading=false;
        print(response[0].doctorName);
      }
    else{
      emit(DoctorProfileFailure());
      isLoading=false;
    }

}
Future<void> getSchedule({required String id})async{
  response2=await DoctorProfileApi().getDoctorSchedule(id: id);
  print(response2[0].dayName);
}
  Future <int> checkAppointmentState( var doctorName,  var doctorSpecialty ,  var data, var time) async {
    int appointmentResponse = await AppointmentDataSqlite().insertAppointmentData(doctorName: doctorName , doctorSpecialty: doctorSpecialty,data: data , time: time);

    if (appointmentResponse == 0) {
      return appointmentResponse;
    } else if (appointmentResponse > 0) {
      return appointmentResponse;
    }else
    {
      return appointmentResponse;
    }
  }


}


