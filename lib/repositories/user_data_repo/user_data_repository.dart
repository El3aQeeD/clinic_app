import 'package:clinic_app/models/a7a.dart';
import 'package:clinic_app/models/user_data.dart';

abstract class UserDataRepository {
  Future <List<UserData>> getUser({required String email , required String password});
}