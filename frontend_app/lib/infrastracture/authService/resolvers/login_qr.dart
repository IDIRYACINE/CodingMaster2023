import 'package:frontend_app/dataModels/user.dart';
import 'package:graphql/client.dart';
import 'package:services_bus/services_bus.dart';
import 'package:frontend_app/infrastracture/graphQlService/feature.dart'
    as graphql_service;

class LoginWithQrEvent extends BaseEvent {
  final String identifier;

  LoginWithQrEvent(super.serviceId, super.eventId, {required this.identifier});
}

class LoginResponse extends BaseResponse {
  final User? user;

  LoginResponse({this.user});
}

class LoginWithQrEventResolver extends EventResolver<LoginWithQrEvent> {
  final GraphQLClient _graphQlClient;
  LoginWithQrEventResolver(super.eventId, this._graphQlClient, super.serviceId);

  @override
  void resolve(LoginWithQrEvent event, ResponseCallback next) {
    final variables = graphql_service.Variables$Query$FindFirstQrAuth(
        where: graphql_service.Input$QrAuthWhereInput(
      identifier: graphql_service.Input$StringFilter(
        equals: event.identifier,
      ),
    ));

    final options =
        graphql_service.Options$Query$FindFirstQrAuth(variables: variables);

    _graphQlClient.query(options).then((response) {
      final user = userFromJson(response.data!['findFirstQrAuth']);
      next(LoginResponse(user: user));
    });
  }

  LoginWithQrEvent buildEvent(String identifier) =>
      LoginWithQrEvent(serviceId, eventId, identifier: identifier);
}
