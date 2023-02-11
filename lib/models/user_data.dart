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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['user_type_id'] = userTypeId;
    return data;
  }
}
