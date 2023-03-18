import 'adminService/admin_service.dart';
import 'agentService/agent_service.dart';
import 'authService/auth_service.dart';
import 'userService/user_service.dart';

class ServicesGateway {
  static ServicesGateway? _instance;

  factory ServicesGateway.instance() {
    _instance ??= ServicesGateway._();

    return _instance!;
  }

  ServicesGateway._() {
    userService = UserService();

    adminService = AdminService();

    authService = AuthService();

    agentService = AgentService();
  }

  late UserService userService;

  late AdminService adminService;

  late AuthService authService;

  late AgentService agentService;
}
