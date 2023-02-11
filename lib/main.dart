import 'package:clinic_app/bloc/current_screen_cubit/current_screen_logic.dart';
import 'package:clinic_app/bloc/home_cubit/home_logic.dart';
import 'package:clinic_app/bloc/login_cubit/login_logic.dart';
import 'package:clinic_app/views/current_screen_view.dart';
import 'package:clinic_app/views/home_view.dart';
import 'package:clinic_app/views/login_view.dart';
import 'package:clinic_app/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/signUp_cubit/signUp_logic.dart';

void main() {
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
      ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CurrentScreen(),
          ));  },
    );
  }
}

