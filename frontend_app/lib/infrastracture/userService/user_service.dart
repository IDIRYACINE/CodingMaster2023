import 'package:frontend_app/dataModels/user.dart';
import 'package:graphql/client.dart';

import '../graphQlService/feature.dart' as graphql_service;

class UserService {
  final GraphQLClient _graphQlClient;

  UserService(this._graphQlClient);

  Future<User> loadUser(String id) async {
    final variables = graphql_service.Variables$Query$FindUniqueUsers(
        where: graphql_service.Input$UsersWhereUniqueInput(
      id: id,
    ));

    final options =
        graphql_service.Options$Query$FindUniqueUsers(variables: variables);

    return _graphQlClient.query(options).then((response) => User.initial());
  }

  Future<List<User>> loadAllUsers() async {
    final options = graphql_service.Options$Query$FindManyUsers();

    return _graphQlClient.query(options).then((response) => []);
  }
}
