import 'package:frontend_app/infrastracture/authService/resolvers/login_credentials.dart';
import 'package:frontend_app/infrastracture/authService/resolvers/login_qr.dart';
import 'package:graphql/client.dart';
import 'package:services_bus/services_bus.dart';

int _serviceId = 0;

class AuthService extends BaseService {
  final GraphQLClient _graphQlClient;

  AuthService(this._graphQlClient, {required super.serviceId}) {
    _serviceId = serviceId;
    _registerBaseResolvers();
  }

  void _registerBaseResolvers() {
    final loginWithCredentials = LoginWithCredentialsEventResolver(
        currResolverId, _graphQlClient, serviceId);

    final loginWithQr =
        LoginWithQrEventResolver(currResolverId, _graphQlClient, serviceId);

    resolvers.add(loginWithCredentials);
    resolvers.add(loginWithQr);
  }

  @override
  void sendEvent(BaseEvent event) {
    final service = searchAlgorithm.search(resolvers, event.serviceId);
    if (service != null) {
      service.resolve(event, next);
    }
  }

  static int getServiceId() => _serviceId; 
}
