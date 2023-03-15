import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/AgentService/api.dart';
import 'package:frontend_app/infrastracture/services.dart';

class VerifyUser extends Command<VerifyUserEventData, VerifyUserRawEventData,
    VerifyUserResponse> {
  static final eventId = AgentApi.verifyUser.index;
  static final eventName = AgentApi.verifyUser.name;
  static final serviceId = Services.AgentService.index;

  VerifyUser() : super(eventId, eventName);

  @override
  Future<VerifyUserResponse> handleEvent(VerifyUserEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<VerifyUserResponse> handleRawEvent(VerifyUserRawEventData eventData) {
    throw UnimplementedError();
  }
}

class VerifyUserResponse extends ServiceEventResponse {
  VerifyUserResponse(super.messageId, super.responseType);
}

class VerifyUserRawEventData extends RawServiceEventData {
  VerifyUserRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, VerifyUser.eventId);
}

class VerifyUserEventData extends ServiceEventData<VerifyUserRawEventData> {
  VerifyUserEventData(super.requesterId);

  @override
  VerifyUserRawEventData toRawServiceEventData() {
    return VerifyUserRawEventData(
        messageId: messageId, requesterId: requesterId);
  }
}

class VerifyUserEvent extends ServiceEvent<VerifyUserResponse> {
  VerifyUserEvent({required super.eventData, super.callback})
      : super(VerifyUser.eventId, VerifyUser.eventName, VerifyUser.serviceId);
}
