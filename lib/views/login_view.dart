import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> formStateEmail=GlobalKey<FormState>();
  GlobalKey<FormState> formStatePassword=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  Widget imageSection(){
    return  SizedBox(
      width: double.infinity,
      height: 300,
      //color: Colors.red,
      child: Image.asset("images/login.jpg"),
    );
  }

  Widget loginText(String text){
    return Text(text,style:const TextStyle(
        color: Colors.black ,
        fontSize: 40,
        fontWeight: FontWeight.bold),
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
  Widget button(String ButtonTxt){
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: MyColors.darkBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110,vertical: 5),
          child: MaterialButton(onPressed: (){
            if(formStateEmail.currentState!.validate()
                &&formStatePassword.currentState!.validate()
            )
            {
              print("innnnnn");
            }
            else
            {
              print("error");
            }
          },
            child: Text(ButtonTxt ,style: TextStyle(color: Colors.white,fontSize: 16,)),
          ),
        ),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageSection(),
                const SizedBox(
                  height: 20,
                ),
                loginText('Login'),
                const SizedBox(
                  height: 20,
                ),

                formEmail(),
                formPassword(),

                const SizedBox(
                  height: 10,
                ),
                button("Login"),
                const SizedBox(
                  height: 15,
                ),


              ],
            ) ,
          ) ,
        ),
      ),
    );
  }
}
