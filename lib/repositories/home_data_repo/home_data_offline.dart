

import 'package:clinic_app/models/home_data.dart';
import 'package:clinic_app/repositories/home_data_repo/home_data_repository.dart';

class HomeDataOffline extends HomeDataRepository{



  List<HomeData> getHomeDataOffline() {
  List<HomeData> homeDataList = [];
  try {

    List response = [{'doctor_id': '1', 'doctor_name': 'George Wassouf', 'doctor_specialty': 'tabib gra7', 'doctor_about': 'Hello my name is George', 'doctor_image': '182doctorLogo.jpg'}, {'doctor_id': '3', 'doctor_name': 'Mohamed Hany', 'doctor_specialty': 'tabib ketaf', 'doctor_about': 'Hello my name is Hany', 'doctor_image': '653doctorLogo2.jpg'}, {'doctor_id': '5', 'doctor_name': 'Khaled Mostafa', 'doctor_specialty': 'Tabib bo2 w asnan', 'doctor_about': 'Hello my name is Khaled', 'doctor_image': '193doctorLogo2.jpg'}];
    print(response);
    homeDataList = response.map((homeData) => HomeData.fromJson(homeData)).toList();

  }catch(exception){
    print(exception);

  }
  print(homeDataList);
  return homeDataList;

}

  @override
  Future<List<HomeData>> getHomeData() {
    // TODO: implement getHomeData
    throw UnimplementedError();
  }
}
