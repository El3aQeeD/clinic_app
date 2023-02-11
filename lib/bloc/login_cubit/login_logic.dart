import 'package:clinic_app/bloc/login_cubit/login_state.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_api.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{


  UserDataRepository? userDataRepository;
  LoginCubit({this.userDataRepository}):super(LoginInitial());
  late List response;
  bool isLoading=false;


   LoginCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  Future<void> checkLoginState({required String email, required String password})async {
    emit(LoginLoading());
    isLoading = true;
    response = await UserDataApi().getUser(email: email , password:password);
    print("herrhher");
    if(response.isNotEmpty){
      print("suc");
      emit(LoginSuccess());
      isLoading=false;
    }
    else
    {
      print("response empty");
      emit(LoginFailure());
      isLoading=false;
    }


  }
}

