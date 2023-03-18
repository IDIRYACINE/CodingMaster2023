
class AuthEvent {}


class LoginEvent extends AuthEvent {
  final bool isLoggedIn;

  LoginEvent(this.isLoggedIn);
}

