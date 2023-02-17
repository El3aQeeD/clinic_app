

import '../../models/appointment_data.dart';

abstract class AppointmentDataRepository{
  Future <List<AppointmentData>> getAppointmentData();
  Future <int> insertAppointmentData({required var doctorName, required var doctorSpecialty , required var data,required var time });
  Future<int> deleteAppointmentData({required var id});
}