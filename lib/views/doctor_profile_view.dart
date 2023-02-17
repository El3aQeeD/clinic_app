import 'dart:ffi';

import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_logic.dart';
import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
class DoctorProfile extends StatelessWidget {
  DoctorProfile({super.key, required this.doctor_id});
  final String doctor_id;
  List<String>?l;
  int k=0;
  DateTime appointment(String time,int duration){

    var moonLanding = DateTime.parse(time) ;

    print(moonLanding.runtimeType);
    print(moonLanding.hour);
    moonLanding=moonLanding.add(Duration(minutes: duration));
    print(moonLanding.hour);
    if(moonLanding.hour>12)
    {
      moonLanding=moonLanding.add(Duration(hours: 12));
      time=moonLanding.toString();
      return moonLanding;
    }
    else{
      return moonLanding;
    }

  }
  int diff(String start,String end)
  {
    int diff=int.parse(end)-int.parse(start);
    return diff*2;
  }

  void _show(BuildContext ctx,String text) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.red.withOpacity(0.5),
        context: ctx,
        builder: (ctx) => Container(
          width: 300,
          height: 50,
          color: Colors.green.shade100,
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(color: Colors.black),),
        ));
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var obj = DoctorProfileCubit(doctorProfileRepository: DoctorProfileApi()).getObj(context);
    obj.checkDoctorProfileState(id: doctor_id);
    DateTime t=DateTime.now();


    return BlocConsumer<DoctorProfileCubit,DoctorProfileState>(
        listener:(context,state){
          if (state is DoctorProfileLoading)
          {
            print("profile loading");
          }
          else if (state is DoctorProfileSuccess)
          {
            print("Profile success");
          }
          else if (state is DoctorProfileFailure)
          {
            print("profile fail");
          }
          else
          {
            print("error in bloc");
          }

        },
        builder: (context, state) => obj.isLoading == true ? const Center(child: CircularProgressIndicator(),) :
        Scaffold(backgroundColor: MyColors.darkBlue,
          appBar: AppBar(backgroundColor: MyColors.darkBlue,
            bottomOpacity: 0.0,
            elevation: 0.0,
            centerTitle: true,
            title:
            Text("Doctor details",style: TextStyle(color: Colors.white,fontSize: 22.sp,fontFamily: 'ARIAL',fontWeight: FontWeight.bold)),

          ),

          body: Stack(
              children: [ ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      height: diff("${appointment("${obj.response2[0].startTime}",0).hour}", "${appointment("${obj.response2[0].endTime}",0).hour}")>5?(height).h:((height-height/6)).h ,
                      child: Stack(
                        children: [

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            top:(height/9).h,
                            child: Container(
                              height: height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(50).r,topRight:Radius.circular(50).r ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: <Widget>[

                                  SizedBox(
                                    height: 80.h,
                                  ),
                                  Text(
                                    '${obj.response[0].doctorName}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ARIAL',
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${obj.response[0].doctorSpecialty}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ARIAL',
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),

                                  Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 20)),
                                      Text("Schedule consultation",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.sp),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      for(var day in obj.response2 )
                                        Text("${day.dayName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),

                                  for(int i=0;i<diff("${appointment("${obj.response2[0].startTime}",0).hour}", "${appointment("${obj.response2[0].endTime}",0).hour}");i++)
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        for(var day in obj.response2 )

                                            MaterialButton(onPressed: () async{
                                              String time = "${DateFormat.Hm().format(appointment("${day.startTime}",30*i))}PM";
                                              String year = '${t.year}-${t.month}-${t.day}';
                                              print(year);
                                              print(time);
                                              int resp =await obj.checkAppointmentState(obj.response[0].doctorName.toString(), obj.response[0].doctorSpecialty.toString(),year,time);
                                              if(resp > 0)
                                                {
                                                  _show(context, "Done");
                                                }
                                              else
                                                {
                                                  _show(context, "problemoo");
                                                }

                                            },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                                                child: Text("${DateFormat.Hm().format(appointment("${day.startTime}",30*i))}PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),

                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(top: (height*0.02).h, left: 0, right: 0,
                            child: Center(
                              child: Container(
                                child: CircleAvatar(radius:60.r,
                                  backgroundImage: NetworkImage('$linkPhotosFolders/${obj.response[0].doctorImage}'),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                  ),

                ],
              ),
              ]
          ),
        )
    );
  }
}