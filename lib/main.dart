
import 'package:clinic_app/bloc/appointment_screen_cubit/appointment_screen_logic.dart';
import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_logic.dart';
import 'package:clinic_app/bloc/edit_user_profile_cubit/edit_user_profile_logic.dart';
import 'package:clinic_app/bloc/home_cubit/home_logic.dart';
import 'package:clinic_app/bloc/login_cubit/login_logic.dart';
import 'package:clinic_app/views/appointment_view.dart';
import 'package:clinic_app/views/current_screen_view.dart';
import 'package:clinic_app/views/doctor_profile_view.dart';
import 'package:clinic_app/views/edit_user_info_view.dart';
import 'package:clinic_app/views/home_view.dart';
import 'package:clinic_app/views/login_view.dart';
import 'package:clinic_app/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/current_screen_cubit/current_screen_logic.dart';
import 'bloc/signUp_cubit/signUp_logic.dart';
late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

      builder: (BuildContext context, Widget? child) { return MultiBlocProvider(providers: [
        BlocProvider(
          create: (context)=>LoginCubit(),
        ),
        BlocProvider(
          create: (context)=>SignupCubit(),
        ),
        BlocProvider(
          create: (context)=>CurrentScreenCubit(),
        ),
        BlocProvider(
          create: (context)=>HomeCubit(),
        ),
        BlocProvider(
          create: (context)=>DoctorProfileCubit(),
        ),
        BlocProvider(
          create: (context)=>AppointmentScreenCubit(),
        ),
        BlocProvider(
          create: (context)=>EditUserProfileCubit(),
        ),
      ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CurrentScreen(),
          ));  },
    );
  }
}

