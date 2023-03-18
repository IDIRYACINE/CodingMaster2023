
import 'package:frontend_app/dataModels/user.dart';

class UserService{

  Future<User> loadUser(String id) async {
    return User.initial();
  }

  Future<List<User>> loadAllUsers() async{
    return [];
  }



}