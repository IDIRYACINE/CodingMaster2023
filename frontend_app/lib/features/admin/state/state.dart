import 'package:frontend_app/dataModels/user.dart';

class AdminState{
  final List<User> users;
  final bool isRegistering;
  final bool isLoading;

  AdminState(this.users, this.isRegistering, this.isLoading);

  factory AdminState.initial(){
    return AdminState([], false, false);
  }

  AdminState copyWith({List<User>? users, bool? isRegistering, bool? isLoading}){
    return AdminState(
      users ?? this.users,
      isRegistering ?? this.isRegistering,
      isLoading ?? this.isLoading,
    );
  }
  
}