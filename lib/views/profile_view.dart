import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:flutter/material.dart';

import '../constnats/my_colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,

        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("profile details",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'ARIAL')),
          ],
        )

      ),
      body:  Container(color: Colors.white,
        child: ListView(
          children: [

            Container(height: 150,
                child: Card( margin: const EdgeInsets.only(left: 40,right: 40,top: 30),
                  color: MyColors.navyBlue,
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20.0), ),
                  elevation: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    SizedBox(width: 30),  CircleAvatar(backgroundColor: Colors.white,radius: 40,),SizedBox(width: 20),
                      Text("kessse morsy",style: TextStyle(fontSize: 20,fontFamily: 'ARIAL'),)
                      //Expanded(child: Container(height: 70,decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),)),
                      //Expanded(child: ListTile(title: Text("Kesse mosry",style: TextStyle(fontSize: 20),)))
                    ],
                  ),
                )
            ),
            SizedBox(height: 50),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [SizedBox(width: 20,),
                      Text("Doctor details",style: TextStyle(fontSize: 20,fontFamily: "ARIAL",fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(padding: EdgeInsets.only(left: 30,right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(color: Colors.lightBlueAccent.withOpacity(0.4),fontWeight: FontWeight.bold),),
                        Text("kesse"),


                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(padding: EdgeInsets.only(left: 30,right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(color: Colors.lightBlueAccent.withOpacity(0.4),fontWeight: FontWeight.bold),),
                        Text("kesse"),


                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(padding: EdgeInsets.only(left: 30,right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(color: Colors.lightBlueAccent.withOpacity(0.4),fontWeight: FontWeight.bold),),
                        Text("kesse"),


                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(padding: EdgeInsets.only(left: 30,right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(color: Colors.lightBlueAccent.withOpacity(0.4),fontWeight: FontWeight.bold),),
                        Text("kesse"),


                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
