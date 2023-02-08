class UserData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? userTypeId;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.userTypeId});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
    phone = json['phone'].toString();
    userTypeId = json['user_type_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['user_type_id'] = this.userTypeId;
    return data;
  }
}
