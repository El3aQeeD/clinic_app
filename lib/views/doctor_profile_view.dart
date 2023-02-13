import 'dart:ffi';

import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_logic.dart';
import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.doctor_id});
  final String doctor_id;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var obj = DoctorProfileCubit(doctorProfileRepository: DoctorProfileApi()).getObj(context);
    obj.checkDoctorProfileState(id: doctor_id);

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
                  height: (height) ,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top:(height/9),
                        child: Container(
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(50).w,topRight:Radius.circular(50).w ),
                            color: Colors.white,
                          ),
                          child: Column(

                            children: [
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
                                children: [
                                  Text("Sunday",style: TextStyle(color: Colors.black,fontSize: 20.sp),),
                                  Text("Tuesday",style: TextStyle(color: Colors.black,fontSize: 20.sp),),
                                  Text("Friday",style: TextStyle(color: Colors.black,fontSize: 20.sp),),
                                ],

                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                                      child: Text("4:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                                  MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                                      child: Text("7:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                                  MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                                      child: Text("9:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                                ],
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("4:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("7:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("9:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("5:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("8:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("10:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 15.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("4:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("7:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("9:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("4:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("7:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("9:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("5:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("8:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("10:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("4:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("7:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("9:30PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("5:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("8:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //     MaterialButton(onPressed: () {  },minWidth: 108.w,color: Colors.grey.shade100,elevation: 0,
                              //         child: Text("10:00PM",style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(top: (height*0.02).h, left: 0, right: 0,
                        child: Center(
                          child: Container(
                            child: CircleAvatar(radius:70.w,
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