import 'package:frontend_app/dataModels/user.dart';

class UserEvent{}

class LoadUserData extends UserEvent{
  final String userId;
  LoadUserData(this.userId);
}

class OnUserLoaded extends UserEvent{
  final User user;
  OnUserLoaded(this.user);
}



