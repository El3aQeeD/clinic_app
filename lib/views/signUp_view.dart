import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  GlobalKey<FormState> formStateName=GlobalKey<FormState>();
  GlobalKey<FormState> formStateEmail=GlobalKey<FormState>();
  GlobalKey<FormState> formStatePhone=GlobalKey<FormState>();
  GlobalKey<FormState> formStatePassword=GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Widget imageSection(){
    return  SizedBox(
      width: double.infinity,
      height: 300,
      //color: Colors.red,
      child: Image.asset("images/doctors.jpg"),
    );
  }

  Widget signUpText(String text){
    return Text(text,style:const TextStyle(
        color: Colors.black ,
        fontSize: 40,
        fontWeight: FontWeight.bold),
    );
  }

  Widget formName(){
    return Form(
        key: formStateName,
        child:
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your Name" , label: const Text("Name",style: TextStyle(color: Colors.grey),), textcontroller: nameController, validatorFunc: (dynamic) {

                 String val = nameController.text;

                  if(val.length<4 && val.isNotEmpty)
                  {
                    return "Input less than 4 character";
                  }
                  if(val.isEmpty){
                    return "Input can not be empty";
                  }

              } ),
            ),
    );
  }

  Widget formEmail(){
    return Form(
        key: formStateEmail,
        child:
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              child: customTextFiled(hintText:"Enter your Email" , label: const Text("Email",style: TextStyle(color: Colors.grey),), textcontroller: emailController, validatorFunc: (dynamic) {
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
              } ),
            ),
    );
  }

  Widget formPassword(){
    return Form(
      key: formStatePassword,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
        child: customTextFiled(hintText:"Enter your password" , label: const Text("Password",style: TextStyle(color: Colors.grey),), textcontroller: passwordController, validatorFunc: (dynamic) {
          String val = passwordController.text;

          if(val.length<4 && val.isNotEmpty)
          {
            return "Input less than 4 character";
          }
          if(val.isEmpty){
            return "Input can not be empty";
          }
        } ),
      ),

    );
  }

  Widget formPhone(){
    return Form(
      key: formStatePhone,
      child:
      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
        child: customTextFiled(hintText:"Enter your phone Number" , label: const Text("Phone number",style: TextStyle(color: Colors.grey),), textcontroller: phoneNumberController, validatorFunc: (dynamic) {
          String val = phoneNumberController.text;

          if(val.length<11 && val.isNotEmpty)
          {
            return "Input must be not less 11 number";
          }
          if(val.isEmpty){
            return "Input can not be empty";
          }
        } ),
      ),
    );
  }

  Widget button(){
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
              print("innnnnn");
            }
            else
            {
              print("error");
            }
          },
            child: const Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 16,)),
          ),
        ),
      ),
    );
  }

  Widget footerText(){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text("Joined us before?" , style: TextStyle(color: Colors.grey),),
          TextButton(onPressed: (){
            print("u should navigate to login screen here");
          },
              child: const Text("Login", style: TextStyle(color: MyColors.darkBlue),)
          ),
        ],

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                formName(),
                formEmail(),
                formPassword(),
                formPhone(),
                const SizedBox(
                  height: 10,
                ),
                button(),
                const SizedBox(
                  height: 8,
                ),
                footerText(),

              ],
            ) ,
          ) ,
        ),
      ),
    );
  }
}
