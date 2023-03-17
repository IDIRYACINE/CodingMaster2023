
import 'package:frontend_app/application/ServiceStore/search_algorithm.dart';
import 'package:frontend_app/infrastracture/services.dart';

import '../../application/ServiceStore/service_store.dart';
import '../helpers.dart';
import 'api.dart';

final _stockServiceId = Services.agentService.index;
final _stockServiceName = Services.agentService.name;

class AgentService extends Service {
  AgentService._(
    SearchAlgorithm<Command, int, Comparator> searchAlgorithm,
  ) : super(
            searchAlgorithm: searchAlgorithm,
            serviceId: _stockServiceId,
            serviceName: _stockServiceName);

  factory AgentService.instance() {
    final searchAlgorithm = commandsBinarySearchAlgorithm();
    final instance = AgentService._(searchAlgorithm);
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

  static void _registerBaseCommands(AgentService instance) {
    instance.initCommands(AgentApi.values.length);

    // instance.replaceCommandAtIndex(LoadProductFamillies(graphQl));
  }
}
