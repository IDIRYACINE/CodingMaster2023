import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/services.dart';

import '../api.dart';
import 'package:graphql/client.dart';

class GetUserData extends Command<GetUserDataEventData, GetUserDataRawEventData,
    GetUserDataResponse> {
  static final eventId = UserApi.getUserData.index;
  static final eventName = UserApi.getUserData.name;
  static final serviceId = Services.usersService.index;

  final GraphQLClient graphQl;

  GetUserData(this.graphQl) : super(eventId, eventName);

  @override
  Future<GetUserDataResponse> handleEvent(GetUserDataEventData eventData) {
    throw UnimplementedError;
  }

  @override
  Future<GetUserDataResponse> handleRawEvent(
      GetUserDataRawEventData eventData) {
    throw UnimplementedError();
  }
}

class GetUserDataResponse extends ServiceEventResponse {
  GetUserDataResponse(super.messageId, super.responseType);
}

class GetUserDataRawEventData extends RawServiceEventData {
  GetUserDataRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, GetUserData.eventId);
}

class GetUserDataEventData extends ServiceEventData<GetUserDataRawEventData> {
  GetUserDataEventData(super.requesterId);

  @override
  GetUserDataRawEventData toRawServiceEventData() {
    return GetUserDataRawEventData(
        messageId: messageId, requesterId: requesterId);
  }
}

class GetUserDataEvent extends ServiceEvent<GetUserDataResponse> {
  GetUserDataEvent({required super.eventData, super.callback})
      : super(
            GetUserData.eventId, GetUserData.eventName, GetUserData.serviceId);
}
