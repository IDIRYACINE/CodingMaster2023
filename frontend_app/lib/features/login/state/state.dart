
class LoginState {
  final bool isAuthenticated;
  final bool isLoading;

  LoginState(this.isAuthenticated, this.isLoading);


  factory LoginState.initial() {
    return LoginState(false, false);
  }

  LoginState copyWith({bool? isAuthenticated, bool? isLoading}) {
    return LoginState(
      isAuthenticated ?? this.isAuthenticated,
      isLoading ?? this.isLoading,
    );
  }
}