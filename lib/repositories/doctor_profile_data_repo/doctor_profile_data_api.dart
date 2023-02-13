import 'dart:ffi';

import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/models/doctor_data.dart';

import 'package:clinic_app/repositories/doctor_profile_data_repo/doctor_profile_data_repository.dart';

class DoctorProfileApi extends DoctorProfileRepository{
  @override
  Future<List<DoctorData>> getDoctorData({required String id})async {
    List<DoctorData> doctorDataList=[];
    try {


      List response = await ApiRequest.postRequest(linkDoctorDetails,{"id":id});

      if(response[0]['status'] != "fail") {
        doctorDataList =
            response.map((doctorData) => DoctorData.fromJson(doctorData)).toList();
      }
      else
      {
      }

    }catch(exception){
      print(exception);

    }

    return doctorDataList;
  }

}