

import 'package:clinic_app/api/api_links.dart';
import 'package:clinic_app/api/api_requests.dart';
import 'package:clinic_app/models/home_data.dart';
import 'package:clinic_app/repositories/home_data_repo/home_data_repository.dart';

class HomeDataApi extends HomeDataRepository {
  @override
  Future<List<HomeData>> getHomeData() async{
    List<HomeData> homeDataList = [];
    try {


      List response = await ApiRequest.postRequest(linkHome,{});
      print(response);

      if(response[0]['status'] != "fail") {
        homeDataList =
            response.map((homeData) => HomeData.fromJson(homeData)).toList();

        print(homeDataList[0].doctorName);
        print(homeDataList.length);
      }
      else
      {
        print(homeDataList);
        print(homeDataList.length);
        print("Home Data Not found");
      }

    }catch(exception){

      print(exception);

    }
    print("home-data-api ##################");
    print(homeDataList);

    return homeDataList;

  }

}
