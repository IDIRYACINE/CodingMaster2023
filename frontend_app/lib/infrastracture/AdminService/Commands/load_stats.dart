
  import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/AdminService/api.dart';
import 'package:frontend_app/infrastracture/services.dart';

class LoadAllStats extends Command<LoadAllStatsEventData, LoadAllStatsRawEventData,
    LoadAllStatsResponse> {
  static final eventId = AdminApi.loadAllStats.index;
  static final eventName = AdminApi.loadAllStats.name;
  static final serviceId = Services.AdminService.index;

  LoadAllStats() : super(eventId, eventName);

  @override
  Future<LoadAllStatsResponse> handleEvent(LoadAllStatsEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<LoadAllStatsResponse> handleRawEvent(
      LoadAllStatsRawEventData eventData) {
    throw UnimplementedError();
  }
  }

  class LoadAllStatsResponse extends ServiceEventResponse {
  LoadAllStatsResponse(super.messageId, super.responseType);
  }

  class LoadAllStatsRawEventData extends RawServiceEventData {
  LoadAllStatsRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, LoadAllStats.eventId);
  }

  class LoadAllStatsEventData extends ServiceEventData<LoadAllStatsRawEventData> {
  LoadAllStatsEventData(super.requesterId);

  @override
  LoadAllStatsRawEventData toRawServiceEventData() {
    return LoadAllStatsRawEventData(messageId: messageId, requesterId: requesterId);
  }
  }


class LoadAllStatsEvent extends ServiceEvent<LoadAllStatsResponse> {
  LoadAllStatsEvent({required super.eventData, super.callback})
      : super(LoadAllStats.eventId, LoadAllStats.eventName, LoadAllStats.serviceId);
}
  