import 'package:frontend_app/dataModels/user.dart';
import 'package:graphql/client.dart';
import '../graphQlService/feature.dart' as graphql_service;

class AuthService {
  final GraphQLClient _graphQlClient;

  AuthService(this._graphQlClient);

  Future<User?> loginWithCredentials(String id, String password) async {
    final variables = graphql_service.Variables$Query$FindUniqueUsers(
        where: graphql_service.Input$UsersWhereUniqueInput(
      id: id,
    ));

    final options =
        graphql_service.Options$Query$FindUniqueUsers(variables: variables);

    return _graphQlClient.query(options).then((response) {
      return userFromJson(response.data!['findUniqueUsers']);
    });
  }

  Future<User?> loginWithQr(String identifier) async {
    final variables = graphql_service.Variables$Query$FindFirstQrAuth(
        where: graphql_service.Input$QrAuthWhereInput(
      identifier: graphql_service.Input$StringFilter(
        equals: identifier,
      ),
    ));

    final options =
        graphql_service.Options$Query$FindFirstQrAuth(variables: variables);

    return _graphQlClient
        .query(options)
        .then((response) => userFromJson(response.data!['findFirstQrAuth']));
  }
}
