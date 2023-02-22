import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/repositories/edit_user_profile/edit_user_profile_repository.dart';

class EditUserProfileApi extends EditUserProfileRepository{
  @override
  Future updateUserData({ required String UserName,required String Email,required String Phone,required String Password}) async{
    try {
      print(sharedPref.get("userId").toString());

      var response = await ApiRequest.postRequest(linkEditUser,{"username":UserName,"email":Email,"phone":Phone,"password":Password,"id":sharedPref.get("userId").toString()});
      print(sharedPref.get("userId").toString());

      if(response['status'] != "fail") {

      }
      else
      {

      }
      return response;
    }catch(exception){
      print(exception);

    }

  }

}