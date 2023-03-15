
import '../../../dataModels/user.dart';

class AgentEvent{}

class VerifyUserEvent extends AgentEvent{
  final User user;

  VerifyUserEvent(this.user);

}

class UserVerificationResultEvent extends AgentEvent{
  final User? user;

  UserVerificationResultEvent( this.user);
}

class VerifyVehicule extends AgentEvent{
  final String matricule;

  VerifyVehicule(this.matricule);
}

class VehiculeVerificationResult extends AgentEvent{
  final String? matricule;

  VehiculeVerificationResult(this.matricule);
}

class RegisterVehicle extends AgentEvent{
  final String matricule;
  final User user ;
  RegisterVehicle(this.matricule, this.user);
}