import 'package:clinic_app/bloc/login_cubit/login_state.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/models/user_data.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_api.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{


  UserDataRepository? userDataRepository;
  LoginCubit({this.userDataRepository}):super(LoginInitial());
  late List<UserData> response;
  bool isLoading=false;


   LoginCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkLoginState({required String email, required String password})async {
    emit(LoginLoading());
    isLoading = true;
    response = await UserDataApi().getUser(email: email , password:password);

    if(response.isNotEmpty){

      emit(LoginSuccess());
      sharedPref.setString("userId", response[0].id.toString());
      sharedPref.setString("email", response[0].email.toString());
      sharedPref.setString("userName", response[0].name.toString());
      sharedPref.setString("phoneNumber", response[0].phone.toString());
      isLoading=false;
    }
    else
    {
      emit(LoginFailure());
      isLoading=false;
    }


  }
}

