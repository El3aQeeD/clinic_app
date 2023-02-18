import 'package:clinic_app/bloc/signUp_cubit/signUp_logic.dart';
import 'package:clinic_app/bloc/signUp_cubit/signUp_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:clinic_app/shared/helper_functions_validation.dart';
import 'package:clinic_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {

  final GlobalKey<FormState> formStateName=GlobalKey<FormState>();
  final GlobalKey<FormState> formStateEmail=GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePhone=GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePassword=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  SignUp({super.key});

  Widget imageSection(){
    return  SizedBox(
      width: double.infinity,
      height: 300.h,
      //color: Colors.red,
      child: Image.asset("images/doctors.jpg"),
    );
  }

  Widget signUpText(String text){
    return Text(text,style: TextStyle(
        color: Colors.black ,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold),
    );
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

  Widget formEmail(){
    return Form(
        key: formStateEmail,
        child:
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
              child: customTextFiled(obscureText: false,textInputType: TextInputType.emailAddress,hintText:"Enter your Email" , label: const Text("Email",style: TextStyle(color: Colors.grey),), textcontroller: emailController, validatorFunc: (dynamic) {
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
        child: customTextFiled(obscureText: true,textInputType: TextInputType.visiblePassword,hintText:"Enter your password" , label: const Text("Password",style: TextStyle(color: Colors.grey),), textcontroller: passwordController, validatorFunc: (dynamic) {
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

  Widget button(SignupCubit obj){
    return Center(
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)).w,
          color: MyColors.darkBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110,vertical: 5),
          child: MaterialButton(onPressed: (){
            if(formStateName.currentState!.validate()
             &&formStateEmail.currentState!.validate()
                &&formStatePassword.currentState!.validate()
                &&formStatePhone.currentState!.validate()
            )
            {
              obj.checkSignUpState(email: emailController.text, password: passwordController.text, name: nameController.text, phoneNumber: phoneNumberController.text);
            }
            else
            {
            }
          },
            child:  Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 15.sp,)),
          ),
        ),
      ),
    );
  }

  Widget footerText(BuildContext context){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("Joined us before?" , style: TextStyle(color: Colors.grey),),
          TextButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
          },
              child: const Text("Login", style: TextStyle(color: MyColors.darkBlue),)
          ),
        ],

    );
  }

  @override
  Widget build(BuildContext context) {
    var obj=SignupCubit.getObj(context);
   return BlocConsumer<SignupCubit,SignUpState>(
     listener:(context,state){
       if(state is SignupLoading){


       }
       else if(state is SignupSuccess)
       {
         obj.isLoading=true;
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
       }
       else if(state is SignupFailure)
       {
         nameController.text="";
         phoneNumberController.text="";
         emailController.text="";
         passwordController.text="";
       }
     } ,
     builder: (context,state)=> obj.isLoading == true ? const Center(child: CircularProgressIndicator(),) :
    Scaffold(
    body: Padding(
    padding:  const EdgeInsets.all(10.0).r,
    child: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child:SafeArea(
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    imageSection(),
     SizedBox(
    height: 20.h,
    ),
    signUpText('Sign up'),
     SizedBox(
    height: 20.h,
    ),
    formName(),

    formEmail(),
    formPassword(),
    formPhone(),
     SizedBox(
    height: 10.h,
    ),
     button(obj),
     SizedBox(
    height: 8.h,
    ),
      footerText(context),

    ],
    ) ,
    ) ,
    ),
    ),
    )
   );
  }
}