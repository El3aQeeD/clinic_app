import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/views/edit_user_info_view.dart';
import 'package:clinic_app/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  Widget infoCard(var height,var width,String img,String title,String subTitle)
  {
    return  Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20).r,
          child: Container(height: height/7,width: (width-(width/5.6)),decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20).r,bottomRight: Radius.circular(20).r),),

              child: Card(elevation: 0,shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20.0).r, //<-- SEE HERE
              ),
                  color:MyColors.darkBlue.withOpacity(0.4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Image.asset(img,width: 50.w,),
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(child: ListTile(title: Text(title,style: TextStyle(fontSize: 14.sp)),subtitle: Text(subTitle,style: TextStyle(fontSize: 16.sp)),)),

                    ],
                  )
              )
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: MyColors.darkWhite,
      appBar: AppBar(
        backgroundColor: MyColors.darkWhite,
        elevation: 0,

        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed:() {
              sharedPref.clear();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
            },icon: Icon(Icons.logout),color: MyColors.darkBlue),
            IconButton(onPressed:() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EditUserInfo())) ,icon: Icon(Icons.edit,color: MyColors.darkBlue,))
          ],
        ),
      ),
      body:Stack(
        children: [

          ListView(physics: BouncingScrollPhysics(),
            children: [
              Image.asset("images/user_icon.png",height: 170.h),
          Container(height: (height-height/3).h,
            child: Column(
              children: [
                infoCard(height, width, "images/user_id.png", "FullName", sharedPref.get('userName').toString()),
                infoCard(height, width, "images/email_icon.png", "Email", sharedPref.get('email').toString()),
                infoCard(height, width, "images/password_icon.png", "Password", "******"),
                infoCard(height, width, "images/phone_icon.png", "Phone", sharedPref.get('phoneNumber').toString()),
              ],
            ),
          )
    ]
    )
    ]
    )

    );
  }
}
