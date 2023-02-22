
import 'package:clinic_app/bloc/current_screen_cubit/current_screen_state.dart';
import 'package:clinic_app/views/appointment_view.dart';
import 'package:clinic_app/views/home_view.dart';
import 'package:clinic_app/views/doctor_profile_view.dart';
import 'package:clinic_app/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentScreenCubit extends Cubit<CurrentScreenState>{
  CurrentScreenCubit():super(CurrentScreenInitial());


  static CurrentScreenCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  List screens=[
      Home(),
      Appointment(),
      UserProfile(),
  ];

  int index=0;
  Color colorHome= Colors.white;
  Color colorProfile= Colors.black;
  Color colorAppointment = Colors.black;

  homeCurrentScreen()
  {

     index=0;
     colorHome= Colors.white;
     colorAppointment = Colors.black;
     colorProfile= Colors.black;

    emit(CurrentScreenHome());
  }

  appointmentCurrentScreen(){

    index =1;

    colorAppointment= Colors.white;
    colorHome= Colors.black;
    colorProfile= Colors.black;


    emit(CurrentScreenAppointment());

  }

  profileCurrentScreen()
  {

    index=2;
    colorHome= Colors.black;
    colorAppointment = Colors.black;
    colorProfile= Colors.white;

    emit(CurrentScreenProfile());

  }


}