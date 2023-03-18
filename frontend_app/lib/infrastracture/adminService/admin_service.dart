import 'package:frontend_app/dataModels/user.dart';
import 'package:frontend_app/dataModels/user_stats.dart';
import 'package:graphql/client.dart';
import '../graphQlService/feature.dart' as graphql_service;

class AdminService {
  final GraphQLClient _graphQlClient;

  AdminService(this._graphQlClient);

  Future<bool> registerUsersList(List<User> users) async {

    // final userType = graphql_service.Input$UserTypesCreateNestedOneWithoutUsersInput(
    //   connect: graphql_service.Input$UserTypesWhereUniqueInput(
    //     id: users.first.userType.index,
    //   ),
    // );

    // final qrAuth = graphql_service.Input$QrAuthCreateNestedOneWithoutUsersInput(
    //   create: graphql_service.Input$QrAuthCreateWithoutUsersInput(
    //     user_id: users.first.id,
    //     identifier : users.first.id,
    //   ),
    // );

    // final variables = graphql_service.Variables$Mutation$CreateManyUsers(
    //     data: users.map((user) => graphql_service.Input$UsersCreateInput(
    //   name: user.name,
    //   id: user.id,
    //   user_type: userType,
    //     qr_auth: qrAuth,
    // )).toList());

    // final options =
    //     graphql_service.Options$Mutation$CreateOneUsers(variables: variables);

    // return _graphQlClient.mutate(options).then((response) => response.data != null);

    return true;
  }

  Future<bool> registerSingleUser(User user) async {

    final userType = graphql_service.Input$UserTypesCreateNestedOneWithoutUsersInput(
      connect: graphql_service.Input$UserTypesWhereUniqueInput(
        id: user.userType.index,
      ),
    );

    final qrAuth = graphql_service.Input$QrAuthCreateNestedOneWithoutUsersInput(
      create: graphql_service.Input$QrAuthCreateWithoutUsersInput(
        user_id: user.id,
        identifier : user.id,
      ),
    );

   final variables = graphql_service.Variables$Mutation$CreateOneUsers(
        data: graphql_service.Input$UsersCreateInput(
      name: user.name,
      id: user.id,
      user_type: userType,
        qr_auth: qrAuth,

    ));

    final options =
        graphql_service.Options$Mutation$CreateOneUsers(variables: variables);

    return _graphQlClient.mutate(options).then((response) => response.data != null);
  }

  Future<List<UserStats>> loadAllUSerStats() async {
    return [];
  }
}
