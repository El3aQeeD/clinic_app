import 'package:clinic_app/bloc/edit_user_profile_cubit/edit_user_profile_state.dart';
import 'package:clinic_app/repositories/edit_user_profile/edit_user_profile_api.dart';
import 'package:clinic_app/repositories/edit_user_profile/edit_user_profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserProfileCubit extends Cubit<EditUserProfileState> {
  EditUserProfileRepository? editUserProfileRepository;
  bool isLoading=false;
  late var response;
  EditUserProfileCubit({this.editUserProfileRepository})
      :super(EditUserProfileInitial());

  EditUserProfileCubit getObj(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future <void> checkEditUserProfileState({ required String UserName, required String Email, required String Phone, required String Password}) async {
    emit(EditUserProfileLoading());
    response= await EditUserProfileApi().updateUserData(UserName: UserName, Email: Email, Phone: Phone, Password: Password);
    print("${response}aaaa");
    if(response.isNotEmpty)
    {

      emit(EditUserProfileSuccess());
      isLoading=false;
    }
    else{
      emit(EditUserProfileFailure());
      print("faaaailllll");
      isLoading=false;
    }
  }
}