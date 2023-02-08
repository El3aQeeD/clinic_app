import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/models/a7a.dart';
import 'package:clinic_app/models/user_data.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_repository.dart';
import 'package:dio/dio.dart';

class UserDataApi extends UserDataRepository{
  @override
  Future<List<UserData>> getUser({required String email, required String password}) async {
    List<UserData> userDataList = [];
  try {
    print(email);
    print(password);
    var response = await Dio().post(linkLogin,data: {"email": email , "password":password});
    //var response = await ApiRequest.postRequest("https://jsonplaceholder.typicode.com/posts", {});
    print(response.data);
    var list = response.data as List;
    print(list);
    //userDataList = list.map((userData) =>UserData.fromJson(userData)).toList();

  }catch(exception){

    print(exception);

  }
  print("user-data-api ##################");
  print(userDataList);

  return userDataList;


  }


}