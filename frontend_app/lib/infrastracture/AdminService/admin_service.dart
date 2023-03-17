
import 'package:frontend_app/infrastracture/AdminService/api.dart';

import '../../application/ServiceStore/search_algorithm.dart';
import '../../application/ServiceStore/service_store.dart';
import '../helpers.dart';
import '../services.dart';

final _adminServiceId = Services.adminService.index;
final _adminServiceName = Services.adminService.name;

class AdminService extends Service {
  AdminService._(
    SearchAlgorithm<Command, int, Comparator> searchAlgorithm,
  ) : super(
            searchAlgorithm: searchAlgorithm,
            serviceId: _adminServiceId,
            serviceName: _adminServiceName);

  factory AdminService.instance() {
    final searchAlgorithm = commandsBinarySearchAlgorithm();
    final instance = AdminService._(searchAlgorithm);
    _registerBaseCommands(instance);
    return instance;
  }

  @override
  void onEventForCallback(ServiceEvent<ServiceEventResponse> event) {
    Command? command = searchAlgorithm.search(commands, event.eventId);
    if (command != null) {
      command.handleEvent(event.eventData).then((response) {
        event.callback?.call(response);
      });
    }
  }

  @override
  Future<ServiceEventResponse> onEventForResponse(
      ServiceEvent<ServiceEventResponse> event) {
    throw UnimplementedError();
  }

  @override
  Future<ServiceEventResponse> onRawEvent(RawServiceEventData event) {
    throw UnimplementedError();
  }

  static void _registerBaseCommands(AdminService instance) {
    instance.initCommands(AdminApi.values.length);

    // instance.replaceCommandAtIndex(LoadProductFamillies(graphQl));
  }
}
