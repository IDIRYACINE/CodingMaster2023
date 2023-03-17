import 'package:frontend_app/application/ServiceStore/service_store.dart';
import 'package:frontend_app/infrastracture/services.dart';

import '../api.dart';

class Login extends Command<LoginEventData, LoginRawEventData, LoginResponse> {
  static final eventId = AuthApi.login.index;
  static final eventName = AuthApi.login.name;
  static final serviceId = Services.authService.index;

  Login() : super(eventId, eventName);

  @override
  Future<LoginResponse> handleEvent(LoginEventData eventData) {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> handleRawEvent(LoginRawEventData eventData) {
    throw UnimplementedError();
  }
}

class LoginResponse extends ServiceEventResponse {
  LoginResponse(super.messageId, super.responseType);
}

class LoginRawEventData extends RawServiceEventData {
  LoginRawEventData({required int messageId, required String requesterId})
      : super(messageId, requesterId, Login.eventId);
}

class LoginEventData extends ServiceEventData<LoginRawEventData> {
  LoginEventData(super.requesterId);

  @override
  LoginRawEventData toRawServiceEventData() {
    return LoginRawEventData(messageId: messageId, requesterId: requesterId);
  }
}

class LoginEvent extends ServiceEvent<LoginResponse> {
  LoginEvent({required super.eventData, super.callback})
      : super(Login.eventId, Login.eventName, Login.serviceId);
}
