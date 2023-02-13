import 'package:clinic_app/bloc/doctor_profile_cubit/doctor_profile_state.dart';
import 'package:clinic_app/models/doctor_data.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_repository.dart';



class DoctorProfileCubit extends Cubit<DoctorProfileState>{
  DoctorProfileRepository? doctorProfileRepository;
  DoctorProfileCubit({this.doctorProfileRepository}):super(DoctorProfileInitial());
  late List<DoctorData> response;
  late List response2;
  bool isLoading=false;

  DoctorProfileCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }
Future <void> checkDoctorProfileState({required String id})async{
    emit(DoctorProfileLoading());
    isLoading = true;
    response=(await DoctorProfileApi().getDoctorData(id: id)).cast<DoctorData>();
    if(response.isNotEmpty)
      {
        print("ohhhhh");
        emit(DoctorProfileSuccess());
        isLoading=false;
        print(response[0].doctorName);
      }
    else{
      emit(DoctorProfileFailure());
      isLoading=false;
    }
}


}