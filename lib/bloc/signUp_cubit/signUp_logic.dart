

import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/bloc/signUp_cubit/signUp_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState>{
  SignupCubit():super(SignupInitial());
  

  
  static SignupCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkSignUpState({required String email, required String password,required String name,required String phoneNumber})async {

      emit(SignupLoading());
      emit(SignupSuccess());

      emit(SignupFailure());





  }


}