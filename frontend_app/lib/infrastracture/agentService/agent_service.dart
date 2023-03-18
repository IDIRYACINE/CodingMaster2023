import 'package:frontend_app/dataModels/user.dart';
import 'package:graphql/client.dart';
import '../graphQlService/feature.dart' as graphql_service;

class VerifyUserResponse {
  final bool isAccessGranted;
  final User user;

  VerifyUserResponse(this.isAccessGranted, this.user);
}

class VerifyVehiculeResponse {
  final bool isAccessGranted;

  VerifyVehiculeResponse(this.isAccessGranted);
}

class AgentService {
  final GraphQLClient _graphQlClient;

  AgentService(this._graphQlClient);

  Future<VerifyUserResponse> verifyUser(String id) async {
    final variables = graphql_service.Variables$Query$FindUniqueUsers(
        where: graphql_service.Input$UsersWhereUniqueInput(
      id: id,
    ));

    final options =
        graphql_service.Options$Query$FindUniqueUsers(variables: variables);

    return _graphQlClient.query(options).then((response) {
      return VerifyUserResponse(true, User.initial());
    });
  }

  Future<VerifyVehiculeResponse> verifyVehicule(
      String userId, String matricule) async {
    return VerifyVehiculeResponse(true);
  }

  Future<bool> linkUserWithVehicule(String userId, String matricule) async {
    final variables = graphql_service.Variables$Mutation$CreateOneVehicules(
        data: graphql_service.Input$VehiculesCreateInput(
      matricule: matricule,
      user_id: userId,
    ));

    final options = graphql_service.Options$Mutation$CreateOneVehicules(
        variables: variables);

    return _graphQlClient.mutate(options).then((response) {
      return response.data != null;
    });
  }
}
