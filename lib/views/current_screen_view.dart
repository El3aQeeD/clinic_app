import 'package:clinic_app/bloc/current_screen_logic/current_screen_logic.dart';
import 'package:clinic_app/bloc/current_screen_logic/current_screen_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});



  Widget homeIcon(CurrentScreenCubit obj)
  {
    return MaterialButton(onPressed: (){
      obj.homeCurrentScreen();
    },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_filled,color: obj.colorHome,),
          Text("Home",style: TextStyle(color: obj.colorHome)),
        ],
      ),
    );
  }

  Widget profileIcon(CurrentScreenCubit obj)
  {
      return MaterialButton(onPressed: (){
        obj.profileCurrentScreen();
      },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle,color: obj.colorProfile,),
            Text("Profile",style: TextStyle(color: obj.colorProfile),),
          ],
        ),
      );
  }



  @override
  Widget build(BuildContext context) {
  var obj = CurrentScreenCubit.getObj(context);
    return BlocConsumer<CurrentScreenCubit,CurrentScreenState>(listener:(context,state){},
          builder: (context,state){
            return  Scaffold(
              bottomNavigationBar: BottomAppBar(
                color: MyColors.darkBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    homeIcon(obj),
                    profileIcon(obj),
                  ],
                ),
              ),
              body: obj.screens[obj.index],

            );
          }
          );
  }
}
