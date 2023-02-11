import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/models/user_data.dart';
import 'package:clinic_app/repositories/user_data_repo/user_data_repository.dart';

class UserDataApi extends UserDataRepository{
  @override
  Future<List<UserData>> getUser({required String email, required String password}) async {
    List<UserData> userDataList = [];
  try {


    List response = await ApiRequest.postRequest(linkLogin, {
      "email": email,
      "password": password,
    });
    print(response);

    if(response[0]['status'] != "fail") {
      userDataList =
          response.map((userData) => UserData.fromJson(userData)).toList();

      print(userDataList[0].name);
      print(userDataList.length);
    }
    else
      {
        print(userDataList);
        print(userDataList.length);
        print("User Not found");
      }

  }catch(exception){

    print(exception);

  }
  print("user-data-api ##################");
  print(userDataList);

  return userDataList;


  }


}