
class AgentEvent {}


class VerifyUserEvent extends AgentEvent {
  final String id;
  VerifyUserEvent({required this.id});
}

class VerifyVehiculeEvent extends AgentEvent {
  final String vehiculeId;
  final String userId;

  VerifyVehiculeEvent({required this.vehiculeId, required this.userId});
}

class NavigateToScreen extends AgentEvent{
  final int screenIndex;
  NavigateToScreen({required this.screenIndex});
}

