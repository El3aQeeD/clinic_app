import 'package:clinic_app/models/doctor_data.dart';

abstract class DoctorProfileRepository{
  Future <List<DoctorData>> getDoctorData({required String id});

}