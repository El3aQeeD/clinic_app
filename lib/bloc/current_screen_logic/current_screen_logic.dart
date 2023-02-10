import 'package:clinic_app/bloc/current_screen_logic/current_screen_state.dart';
import 'package:clinic_app/views/home_view.dart';
import 'package:clinic_app/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentScreenCubit extends Cubit<CurrentScreenState>{
  CurrentScreenCubit():super(CurrentScreenInitial());


  static CurrentScreenCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  List screens=[
     const Home(),
     const Profile(),
  ];

  int index=0;
  Color colorHome= Colors.white;
  Color colorProfile= Colors.black;

  homeCurrentScreen()
  {

     index=0;
     colorHome= Colors.white;
     colorProfile= Colors.black;

    emit(CurrentScreenHome());
  }

  profileCurrentScreen()
  {

      index=1;
     colorHome= Colors.black;
     colorProfile= Colors.white;

    emit(CurrentScreenProfile());

  }



}