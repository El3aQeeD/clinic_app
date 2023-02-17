import 'package:clinic_app/bloc/appointment_screen_cubit/appointment_screen_logic.dart';
import 'package:clinic_app/bloc/appointment_screen_cubit/appointment_screen_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);


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
          child: Text(text,style: const  TextStyle(color: Colors.black),),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var obj = AppointmentScreenCubit.getObj(context);
    obj.checkAppointmentState();


    return Scaffold(
        backgroundColor: MyColors.darkWhite,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Appointment'),
          backgroundColor: MyColors.darkBlue,
        ),
        body: BlocConsumer<AppointmentScreenCubit,AppointmentScreenState>(
          listener: (context, state){
            if(state is AppointmentScreenSuccess)
              {
                print("success");
              }
            if(state is AppointmentScreenLoading)
            {
              print("loading");
            }
            if(state is AppointmentScreenEmpty)
              {
                print("emptyyyy");
              }

          },
          builder: (context,state){
            return obj.isLoading == true ? const Center(child: CircularProgressIndicator(),) : obj.response.isEmpty ? const Center(child: Text("There is no booked appointment"),)  :
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: obj.response.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        const Text("Date",style: TextStyle(color: Colors.grey),),
                                         Text("${obj.response[i].data}"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text("Type",style: TextStyle(color: Colors.grey)),
                                        Text("${obj.response[i].doctorSpecialty}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        const Text("Time",style: TextStyle(color: Colors.grey)),
                                        Text("${obj.response[i].time}"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text("Place",style: TextStyle(color: Colors.grey)),
                                        const Text("City Clinic")
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Doctor",style: TextStyle(color: Colors.grey)),
                                      Text("${obj.response[i].doctorName}"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: TextButton(
                                            onPressed: () {
                                              print("======");
                                              print(obj.response[i].id);
                                              obj.deleteFromAppointment(id: obj.response[i].id);

                                            },
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  );
                });
          },

        ));
  }
}
