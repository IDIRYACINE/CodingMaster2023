import 'package:frontend_app/dataModels/user.dart';

class VerifyUserResponse {
  final bool isAccessGranted;
  final User user;

  VerifyUserResponse(this.isAccessGranted, this.user);
}

class VerifyVehiculeResponse {
  final bool isAccessGranted;

  VerifyVehiculeResponse(this.isAccessGranted);
}

class AgentService {
  Future<VerifyUserResponse> verifyUser(String id) async {
    return VerifyUserResponse(true, User.initial());
  }

  Future<VerifyVehiculeResponse> verifyVehicule(
      String userId, String matricule) async {
    return VerifyVehiculeResponse(true);
  }

  Future<bool> linkUserWithVehicule(String userId, String matricule) async {
    return true;
  }
}
