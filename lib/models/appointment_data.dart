
class AppointmentData {
  String? id;
  String? doctorName;
  String? doctorSpecialty;
  String? time;
  String? data;
  String? userId;


  AppointmentData(
      {this.id, this.doctorName, this.doctorSpecialty, this.time,this.data});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    doctorName = json['doctor_name'].toString();
    doctorSpecialty = json['doctor_specialty'].toString();
    time = json['Time'].toString();
    data = json['Data'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['doctorName'] = doctorName;
    data['doctorSpecialty'] = doctorSpecialty;
    data['Time'] = time;
    data['Date'] = this.data;
    return data;
  }
}
