import 'package:frontend_app/dataModels/user.dart';
import 'package:graphql/client.dart';
import 'package:services_bus/services_bus.dart';
import 'package:frontend_app/infrastracture/graphQlService/feature.dart'
    as graphql_service;

int _serviceId = 0;
int _eventId = 0;


class LoginWithCredentialsEvent extends BaseEvent {
  final String identifier;
  final String password;

  LoginWithCredentialsEvent(super.serviceId, super.eventId,
      {required this.identifier, required this.password}){
        _serviceId = serviceId;
        _eventId = eventId;
      }
}

class LoginResponse extends BaseResponse {
  final User? user;

  LoginResponse({this.user});
}

class LoginWithCredentialsEventResolver
    extends EventResolver<LoginWithCredentialsEvent> {
  final GraphQLClient _graphQlClient;

  LoginWithCredentialsEventResolver(
      super.eventId, this._graphQlClient, super.serviceId);

  @override
  void resolve(LoginWithCredentialsEvent event, ResponseCallback next) {
    final variables = graphql_service.Variables$Query$FindUniqueUsers(
        where: graphql_service.Input$UsersWhereUniqueInput(
      id: event.identifier,
    ));

    final options =
        graphql_service.Options$Query$FindUniqueUsers(variables: variables);

    _graphQlClient.query(options).then((response) {
      final user = userFromJson(response.data!['findUniqueUsers']);

      next(LoginResponse(user: user));
    });
  }

  static LoginWithCredentialsEvent buildEvent(String identifier, String password) =>
      LoginWithCredentialsEvent(_serviceId, _eventId,
          identifier: identifier, password: password);
}
