import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.darkWhite,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Appointment'),
          backgroundColor: MyColors.darkBlue,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: 8,
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
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Date"),
                                    Text("15/7/2023"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Type"),
                                    Text("Dentist")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Time"),
                                    Text("10:30 Pm"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Place"),
                                    Text("City Clinic")
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Doctor"),
                                  const Text("Dr. Khaled Mostafa"),
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
                                        onPressed: () {},
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
            }));
  }
}
