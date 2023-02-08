

import 'package:clinic_app/bloc/login_cubit/login_state.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit({this.userDataRepository}):super(LoginInitial());
  late List response;

  UserDataRepository? userDataRepository;

  static LoginCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkLoginState({required String email, required String password})async {
    emit(LoginLoading());
    response = await this.userDataRepository!.getUser(email: email , password:password);
    if(response.isNotEmpty){
      emit(LoginSuccess());
    }
    else
    {
      emit(LoginFailure());
    }


  }
}

