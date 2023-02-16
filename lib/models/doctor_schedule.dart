class DoctorSchedule {
  String? dSId;
  String? startTime;
  String? dayName;
  String? endTime;
  String? doctorId;

  DoctorSchedule(
      {this.dSId,
        this.startTime,
        this.dayName,
        this.endTime,
        this.doctorId});

  DoctorSchedule.fromJson(Map<String, dynamic> json) {
    dSId = json['DS_id'];
    startTime = json['start_time'];
    dayName = json['day_name'];
    endTime = json['end_time'];
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DS_id'] = this.dSId;
    data['start_time'] = this.startTime;
    data['day_name'] = this.dayName;
    data['end_time'] = this.endTime;
    data['doctor_id'] = this.doctorId;
    return data;
  }
}
