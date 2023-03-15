


import 'package:frontend_app/application/ServiceStore/searchAlgorithms/binary_search.dart';
import 'package:frontend_app/application/ServiceStore/service_store.dart';

import 'AdminService/admin_service.dart';
import 'AgentService/agent_service.dart';
import 'AuthService/auth_service.dart';
import 'UserService/user_service.dart';

class ServicesGateway extends ServiceStore {
  static ServicesGateway? _instance;

  ServicesGateway._(super.searchAlgorithm);

  factory ServicesGateway.instance() {
    if (_instance == null) {
      final searchAlgorithm = _searchAlgorithm();
      _instance = ServicesGateway._(searchAlgorithm);
      _registerBaseServices(_instance!);
    }
    return _instance!;
  }

  static BinarySearchAlgorithm<Service, int> _searchAlgorithm() {
    return BinarySearchAlgorithm(
      BinarySearchComparator(
        isGreaterThan: (Service service, int id) => service.serviceId > id,
        isLessThan: (Service service, int id) => service.serviceId < id,
      ),
    );
  }

  static void _registerBaseServices(ServicesGateway gateway) {
    final authService = AuthService.instance();
    gateway.registerServiceAtIndex(authService);

        final adminService = AdminService.instance();
    gateway.registerServiceAtIndex(adminService);

    final userService = UserService.instance();
    gateway.registerServiceAtIndex(userService);

    final agentService = AgentService.instance();
    gateway.registerServiceAtIndex(agentService);

  }

  
}
