class LoginEvent {}

class LoginWithQr extends LoginEvent{}

class LoginWithCredentials extends LoginEvent{
  final String username;
  final String password;

  LoginWithCredentials(this.username, this.password);
}