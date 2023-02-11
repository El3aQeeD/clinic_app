import 'package:clinic_app/bloc/login_cubit/login_logic.dart';
import 'package:clinic_app/bloc/login_cubit/login_state.dart';
import 'package:clinic_app/constnats/my_colors.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_api.dart';
import 'package:clinic_app/shared/custom_text_field.dart';
import 'package:clinic_app/shared/helper_functions_validation.dart';
import 'package:clinic_app/views/current_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {


  final GlobalKey<FormState> formStateEmail=GlobalKey<FormState>();
  final GlobalKey<FormState> formStatePassword=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  Login({super.key});


  Widget imageSection(){
    return  SizedBox(
      width: double.infinity,
      height: 300,
      //color: Colors.red,
      child: Image.asset("images/login.jpg"),
    );
  }

  Widget loginText(String text){
    return Text(text,style: TextStyle(
        color: Colors.black ,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold),
    );
  }
  Widget formEmail(){
    return Form(
      key: formStateEmail,
      child:
      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20).r,
        child: customTextFiled(obscureText: false,textInputType: TextInputType.text,hintText:"Enter your Email" , label: const Text("Email",style: TextStyle(color: Colors.grey),), textcontroller: emailController, validatorFunc: (dynamic) {
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

  Widget button(String buttonTxt ,LoginCubit obj){
    return Center(
      child: Container(
        decoration:  BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(10)).w,
          color: MyColors.darkBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110,vertical: 5),
          child: MaterialButton(onPressed: ()async{
            //var response = await UserDataApi().getUser(email: emailController.text, password: passwordController.text);
            if(formStateEmail.currentState!.validate()
                &&formStatePassword.currentState!.validate()
            )
            {

                obj.checkLoginState(email: emailController.text, password: passwordController.text);

              print("in");
            }
            else
            {
              //print("error");
            }
          },
            child: Text(buttonTxt ,style:  TextStyle(color: Colors.white,fontSize: 16.sp,)),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    var obj =LoginCubit(userDataRepository: UserDataApi()).getObj(context);


    return
       BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
        if(state is LoginLoading){
          print("loading...");
          

        }
        else if(state is LoginSuccess)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CurrentScreen()));
          print("success");
        }
        else if(state is LoginFailure)
        {

          emailController.text="";
          passwordController.text="";
          print("bad");
        }
      },
        builder: (context,state)=> obj.isLoading == true ? const Center(child: CircularProgressIndicator(),) :
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
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
                    loginText('Login'),
                     SizedBox(
                      height: 20.h,
                    ),

                    formEmail(),
                    formPassword(),

                     SizedBox(
                      height: 10.h,
                    ),
                    InkWell(onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CurrentScreen())),child: button("Login",obj)),
                     SizedBox(
                      height: 15.h,
                    ),


                  ],
                ) ,
              ) ,
            ),
          ),
        ),

    );
  }
}
