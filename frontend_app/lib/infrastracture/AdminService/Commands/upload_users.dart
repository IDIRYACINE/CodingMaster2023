import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/AdminService/api.dart';
import 'package:frontend_app/infrastracture/services.dart';

class UploadUsers extends Command<UploadUsersEventData, UploadUsersRawEventData,
    UploadUsersResponse> {
  static final eventId = AdminApi.uploadUsers.index;
  static final eventName = AdminApi.uploadUsers.name;
  static final serviceId = Services.adminService.index;

  UploadUsers() : super(eventId, eventName);

  @override
  Future<UploadUsersResponse> handleEvent(UploadUsersEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<UploadUsersResponse> handleRawEvent(
      UploadUsersRawEventData eventData) {
    throw UnimplementedError();
  }
}

class UploadUsersResponse extends ServiceEventResponse {
  UploadUsersResponse(super.messageId, super.responseType);
}

class UploadUsersRawEventData extends RawServiceEventData {
  UploadUsersRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, UploadUsers.eventId);
}

class UploadUsersEventData extends ServiceEventData<UploadUsersRawEventData> {
  UploadUsersEventData(super.requesterId);

  @override
  UploadUsersRawEventData toRawServiceEventData() {
    return UploadUsersRawEventData(
        messageId: messageId, requesterId: requesterId);
  }
}

class UploadUsersEvent extends ServiceEvent<UploadUsersResponse> {
  UploadUsersEvent({required super.eventData, super.callback})
      : super(
            UploadUsers.eventId, UploadUsers.eventName, UploadUsers.serviceId);
}
