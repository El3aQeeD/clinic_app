import 'package:clinic_app/bloc/edit_user_profile_cubit/edit_user_profile_logic.dart';
import 'package:clinic_app/bloc/edit_user_profile_cubit/edit_user_profile_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:clinic_app/shared/helper_functions_validation.dart';
import 'package:clinic_app/views/current_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserInfo extends StatefulWidget {
  const EditUserInfo({Key? key}) : super(key: key);

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  @override
  final GlobalKey<FormState> formStateName=GlobalKey<FormState>();
  final GlobalKey<FormState> formStateEmail=GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePhone=GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePassword=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  void initState(){
    nameController.text=sharedPref.get('userName').toString();
    emailController.text=sharedPref.get("email").toString();
    phoneNumberController.text=sharedPref.get("phoneNumber").toString();
    super.initState();
  }
  Widget formName(){
  return Form(
    key: formStateName,
    child:
    Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
      child: customTextFiled(obscureText: false,textInputType: TextInputType.name,hintText:"Enter your Name" , label: const Text("Name",style: TextStyle(color: Colors.grey),), textcontroller: nameController, validatorFunc: (dynamic) {

        String val = nameController.text;

        if(val.length<4 && val.isNotEmpty)
        {
          return "Input less than 4 character";
        }
        if(val.isEmpty){
          return "Input can not be empty";
        }
        if(!isValidName(val))
        {
          return 'Invalid Name';
        }
        return null;

      } ),
    ),
  );
  }
  Widget formPhone(){
  return Form(
    key: formStatePhone,
    child:
    Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
      child: customTextFiled(obscureText: false,textInputType: TextInputType.phone,hintText:"Enter your phone Number" , label: const Text("Phone number",style: TextStyle(color: Colors.grey),), textcontroller: phoneNumberController, validatorFunc: (dynamic) {
        String val = phoneNumberController.text;
        if(val.length<11 && val.isNotEmpty)
        {
          return "Input must be not less than 11 number";
        }
        if(val.length>11 && val.isNotEmpty)
        {
          return "Input must be not greater than 11 number";
        }
        if(val.isEmpty){
          return "Input can not be empty";
        }
        if(!isValidPhone(val))
        {
          return "Only numbers allowed";
        }

        return null;
      } ),
    ),
  );
  }
  Widget formEmail(){
  return Form(
    key: formStateEmail,
    child:
    Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
      child: customTextFiled(obscureText: false,textInputType: TextInputType.text,hintText:"Enter your Email" , label: const Text("Email",style: TextStyle(color: MyColors.darkBlue),), textcontroller: emailController, validatorFunc: (dynamic) {
        String val = emailController.text;
        if(!val.contains("@"))
        {
          return "Input must be like @gmail , yahoo";
        }
        if(val.length<4 && val.isNotEmpty)
        {
          return "Input less than 4 character";
        }
        if(val.isEmpty){
          return "Input can not be empty";
        }
        if(!isValidEmail(val))
        {
          return 'invalid email';
        }
        return null;
      } ),
    ),
  );
  }
  Widget formPassword(){
    return Form(
      key: formStatePassword,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
        child: customTextFiled(obscureText: true,textInputType: TextInputType.text,hintText:"Enter your password" , label: const Text("Password",style: TextStyle(color: Colors.grey),), textcontroller: passwordController, validatorFunc: (dynamic) {
          String val = passwordController.text;

          if(val.length<4 && val.isNotEmpty)
          {
            return "Input less than 4 character";
          }
          if(val.isEmpty){
            return "Input can not be empty";
          }
          return null;
        } ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    var obj = EditUserProfileCubit().getObj(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return BlocConsumer<EditUserProfileCubit,EditUserProfileState>(builder:(context,state)=>  Scaffold(backgroundColor: MyColors.darkWhite,
        appBar: AppBar(
          backgroundColor: MyColors.darkWhite,
          elevation: 0,

          title: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed:() {
                obj.checkEditUserProfileState(UserName: nameController.text, Email: emailController.text, Phone: phoneNumberController.text, Password: passwordController.text);
              },icon: Icon(Icons.done),color: MyColors.darkBlue),

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
                          formName(),
                          formEmail(),
                          formPassword(),
                          formPhone(),
                        ],
                      ),
                    )
                  ]
              )
            ]
        )

    ), listener:(context,state){
      if(state is EditUserProfileLoading){


      }
      else if(state is EditUserProfileSuccess)
      {
        obj.isLoading=true;
        sharedPref.setString('userName', nameController.text);
        sharedPref.setString('email', emailController.text);
        sharedPref.setString('phoneNumber', phoneNumberController.text);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CurrentScreen()));
      }
      else if(state is EditUserProfileFailure)
      {
        nameController.text="";
        phoneNumberController.text="";
        emailController.text="";
        passwordController.text="";
      }
    } ,);

  }
}
