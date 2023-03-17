
  import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/AdminService/api.dart';
import 'package:frontend_app/infrastracture/services.dart';

class DownloadUsers extends Command<DownloadUsersEventData, DownloadUsersRawEventData,
    DownloadUsersResponse> {
  static final eventId = AdminApi.downloadUsers.index;
  static final eventName = AdminApi.downloadUsers.name;
  static final serviceId = Services.adminService.index;

  DownloadUsers() : super(eventId, eventName);

  @override
  Future<DownloadUsersResponse> handleEvent(DownloadUsersEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<DownloadUsersResponse> handleRawEvent(
      DownloadUsersRawEventData eventData) {
    throw UnimplementedError();
  }
  }

  class DownloadUsersResponse extends ServiceEventResponse {
  DownloadUsersResponse(super.messageId, super.responseType);
  }

  class DownloadUsersRawEventData extends RawServiceEventData {
  DownloadUsersRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, DownloadUsers.eventId);
  }

  class DownloadUsersEventData extends ServiceEventData<DownloadUsersRawEventData> {
  DownloadUsersEventData(super.requesterId);

  @override
  DownloadUsersRawEventData toRawServiceEventData() {
    return DownloadUsersRawEventData(messageId: messageId, requesterId: requesterId);
  }
  }


class DownloadUsersEvent extends ServiceEvent<DownloadUsersResponse> {
  DownloadUsersEvent({required super.eventData, super.callback})
      : super(DownloadUsers.eventId, DownloadUsers.eventName, DownloadUsers.serviceId);
}
  