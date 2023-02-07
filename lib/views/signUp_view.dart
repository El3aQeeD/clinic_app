import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Widget imageSection(){
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.red,
    );
  }

  Widget signUpText(String text){
    return Text(text,style:const TextStyle(
        color: Colors.black ,
        fontSize: 40,
        fontWeight: FontWeight.bold),
    );
  }

  Widget formSection(){
    return Form(
        key: formstate,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your Name" , label: const Text("Name",style: TextStyle(color: Colors.black),), textcontroller: nameController ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your Email" , label: const Text("Email",style: TextStyle(color: Colors.black),), textcontroller: emailController ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your password" , label: const Text("Password",style: TextStyle(color: Colors.black),), textcontroller: passwordController ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your phone Number" , label: const Text("Phone number",style: TextStyle(color: Colors.black),), textcontroller: phoneNumberController ),
            ),
          ],)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child:SafeArea(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageSection(),
               const SizedBox(
                  height: 20,
                ),
                signUpText('Sign up'),
                const SizedBox(
                  height: 20,
                ),
                formSection(),



              ],
            ) ,
          ) ,
        ),
      ),
    );
  }
}
