class HomeData {
  String? doctorId;
  String? doctorName;
  String? doctorSpecialty;
  String? doctorAbout;
  String? doctorImage;

  HomeData(
      {this.doctorId,
        this.doctorName,
        this.doctorSpecialty,
        this.doctorAbout,
        this.doctorImage});

  HomeData.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'].toString();
    doctorName = json['doctor_name'].toString();
    doctorSpecialty = json['doctor_specialty'].toString();
    doctorAbout = json['doctor_about'].toString();
    doctorImage = json['doctor_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    data['doctor_name'] = doctorName;
    data['doctor_specialty'] = doctorSpecialty;
    data['doctor_about'] = doctorAbout;
    data['doctor_image'] = doctorImage;
    return data;
  }
}
