import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/services.dart';

import '../api.dart';

class RegisterVehicule extends Command<RegisterVehiculeEventData,
    RegisterVehiculeRawEventData, RegisterVehiculeResponse> {
  static final eventId = AgentApi.registerVehicule.index;
  static final eventName = AgentApi.registerVehicule.name;
  static final serviceId = Services.agentService.index;

  RegisterVehicule() : super(eventId, eventName);

  @override
  Future<RegisterVehiculeResponse> handleEvent(
      RegisterVehiculeEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<RegisterVehiculeResponse> handleRawEvent(
      RegisterVehiculeRawEventData eventData) {
    throw UnimplementedError();
  }
}

class RegisterVehiculeResponse extends ServiceEventResponse {
  RegisterVehiculeResponse(super.messageId, super.responseType);
}

class RegisterVehiculeRawEventData extends RawServiceEventData {
  RegisterVehiculeRawEventData(
      {required int messageId, required String requesterId})
      : super(messageId, requesterId, RegisterVehicule.eventId);
}

class RegisterVehiculeEventData
    extends ServiceEventData<RegisterVehiculeRawEventData> {
  RegisterVehiculeEventData(super.requesterId);

  @override
  RegisterVehiculeRawEventData toRawServiceEventData() {
    return RegisterVehiculeRawEventData(
        messageId: messageId, requesterId: requesterId);
  }
}

class RegisterVehiculeEvent extends ServiceEvent<RegisterVehiculeResponse> {
  RegisterVehiculeEvent({required super.eventData, super.callback})
      : super(RegisterVehicule.eventId, RegisterVehicule.eventName,
            RegisterVehicule.serviceId);
}
