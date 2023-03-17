import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/AgentService/api.dart';
import 'package:frontend_app/infrastracture/services.dart';

class VerifyVehicule extends Command<VerifyVehiculeEventData,
    VerifyVehiculeRawEventData, VerifyVehiculeResponse> {
  static final eventId = AgentApi.verifyVehicule.index;
  static final eventName = AgentApi.verifyVehicule.name;
  static final serviceId = Services.agentService.index;

  VerifyVehicule() : super(eventId, eventName);

  @override
  Future<VerifyVehiculeResponse> handleEvent(
      VerifyVehiculeEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<VerifyVehiculeResponse> handleRawEvent(
      VerifyVehiculeRawEventData eventData) {
    throw UnimplementedError();
  }
}

class VerifyVehiculeResponse extends ServiceEventResponse {
  VerifyVehiculeResponse(super.messageId, super.responseType);
}

class VerifyVehiculeRawEventData extends RawServiceEventData {
  VerifyVehiculeRawEventData(
      {required int messageId, required String requesterId})
      : super(messageId, requesterId, VerifyVehicule.eventId);
}

class VerifyVehiculeEventData
    extends ServiceEventData<VerifyVehiculeRawEventData> {
  VerifyVehiculeEventData(super.requesterId);

  @override
  VerifyVehiculeRawEventData toRawServiceEventData() {
    return VerifyVehiculeRawEventData(
        messageId: messageId, requesterId: requesterId);
  }
}

class VerifyVehiculeEvent extends ServiceEvent<VerifyVehiculeResponse> {
  VerifyVehiculeEvent({required super.eventData, super.callback})
      : super(VerifyVehicule.eventId, VerifyVehicule.eventName,
            VerifyVehicule.serviceId);
}
