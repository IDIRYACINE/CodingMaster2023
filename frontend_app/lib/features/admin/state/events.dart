
import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/dataModels/user_stats.dart';

class AdminEvent {}

class LoadUsersEvent extends AdminEvent {
  final List<User> users;

  LoadUsersEvent({required this.users});
}

class ImportUsersEventResult extends AdminEvent {
  final bool isImportingUsers;

  ImportUsersEventResult({required this.isImportingUsers});
}

class LoadUserStatsEvent extends AdminEvent {
  final List<UserStats> userStats;

  LoadUserStatsEvent({required this.userStats});
}

class NavigateToScreenEvent extends AdminEvent {
  final int screnIndex;

  NavigateToScreenEvent({required this.screnIndex});
}