
import 'package:frontend_app/dataModels/user.dart';

class UserEvent {}

class NavigateToScreenEvent extends UserEvent {
  final int screenIndex;
  NavigateToScreenEvent(this.screenIndex);
}

class UpdateUserEvent extends UserEvent {
  final User user;
  UpdateUserEvent(this.user);
}