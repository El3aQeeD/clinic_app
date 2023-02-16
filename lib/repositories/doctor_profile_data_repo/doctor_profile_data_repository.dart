import 'package:clinic_app/models/doctor_data.dart';
import 'package:clinic_app/models/doctor_schedule.dart';

abstract class DoctorProfileRepository{
  Future <List<DoctorData>> getDoctorData({required String id});
  Future <List<DoctorSchedule>> getDoctorSchedule({required String id});

}