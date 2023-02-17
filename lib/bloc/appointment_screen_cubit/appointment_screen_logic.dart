import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/bloc/appointment_screen_cubit/appointment_screen_state.dart';
import 'package:clinic_app/models/appointment_data.dart';
import 'package:clinic_app/repositories/appointment_data_repo/appointment_data.dart';
import 'package:clinic_app/repositories/appointment_data_repo/appointment_data_sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_links.dart';

class AppointmentScreenCubit extends Cubit<AppointmentScreenState> {
  AppointmentScreenCubit({this.appointmentDataRepository}):super(AppointmentScreenInitial());
  bool isLoading = true;
  late List<AppointmentData> response;
  late int deleteResponse;
  AppointmentDataRepository? appointmentDataRepository;

  static AppointmentScreenCubit getObj(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> checkAppointmentState() async {
    emit(AppointmentScreenLoading());
    response = await AppointmentDataSqlite().getAppointmentData();
    if (response.isNotEmpty ) {
      isLoading = false;
      print("donne");
      emit(AppointmentScreenSuccess());
    }
    else{
      isLoading = false;
      print("namsmasas");
      emit(AppointmentScreenEmpty());
    }

  }

  Future deleteFromAppointment({required int id}) async{
     deleteResponse = await AppointmentDataSqlite().deleteAppointmentData(id: response[id].id);
     print("******************");
     print(deleteResponse);
    if(deleteResponse == 1){
      deleteResponse=1;
      response.removeAt(id);
      if(response.isEmpty){
        emit(AppointmentScreenEmpty());
      }else{
        emit(AppointmentDeletedSuccess());
      }
    }
    else
    {
      deleteResponse=0;
      emit(AppointmentScreenFailure());
    }
  }
}