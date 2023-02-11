class HomeData {
  String? doctorId;
  String? doctorName;
  String? doctorSpecialtyId;
  String? doctorAbout;
  String? doctorImage;

  HomeData(
      {this.doctorId,
        this.doctorName,
        this.doctorSpecialtyId,
        this.doctorAbout,
        this.doctorImage});

  HomeData.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'].toString();
    doctorName = json['doctor_name'].toString();
    doctorSpecialtyId = json['doctor_specialty_id'].toString();
    doctorAbout = json['doctor_about'].toString();
    doctorImage = json['doctor_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    data['doctor_name'] = doctorName;
    data['doctor_specialty_id'] = doctorSpecialtyId;
    data['doctor_about'] = doctorAbout;
    data['doctor_image'] = doctorImage;
    return data;
  }
}
