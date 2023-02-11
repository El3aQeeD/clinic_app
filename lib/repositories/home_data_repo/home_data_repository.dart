import 'package:clinic_app/models/home_data.dart';

abstract class HomeDataRepository {
  Future <List<HomeData>> getHomeData();

}