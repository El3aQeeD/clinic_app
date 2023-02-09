

import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/bloc/signUp_cubit/signUp_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState>{
  SignupCubit():super(SignupInitial());
  bool isLoading=false;

  
  static SignupCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkSignUpState({required String email, required String password,required String name,required String phoneNumber})async {

      emit(SignupLoading());
      var response= await ApiRequest.postRequest(linkSignup, {"username":name,"email":email,"password":password,"phone":phoneNumber});

  if(response["status"]=='success')
    {
      print(response["status"]);
      emit(SignupSuccess());
    }
  else {
    emit(SignupFailure());
  }





  }


}