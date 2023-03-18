
class AuthState{
  
  final bool isAuthenticated;

  AuthState({required this.isAuthenticated});

  factory AuthState.initial() => AuthState(isAuthenticated: false);

  AuthState copyWith({bool? isAuthenticated}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

}