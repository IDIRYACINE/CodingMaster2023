import 'adminService/admin_service.dart';
import 'agentService/agent_service.dart';
import 'authService/auth_service.dart';
import 'graphQlService/feature.dart';
import 'userService/user_service.dart';

class ServicesGateway {
  static ServicesGateway? _instance;

  factory ServicesGateway.instance() {
    _instance ??= ServicesGateway._();

    return _instance!;
  }

  ServicesGateway._() {
    final graphQlClient = buildGraphQlClient();

    userService = UserService(graphQlClient);

    adminService = AdminService(graphQlClient);

    authService = AuthService(graphQlClient);

    agentService = AgentService(graphQlClient);
  }

  late UserService userService;

  late AdminService adminService;

  late AuthService authService;

  late AgentService agentService;
}
