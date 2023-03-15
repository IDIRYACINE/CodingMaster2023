

import 'package:frontend_app/infrastracture/services.dart';

import '../../application/GraphQlHelpers/graphql_utility.dart';
import '../../application/ServiceStore/search_algorithm.dart';
import '../../application/ServiceStore/service_store.dart';
import '../helpers.dart';
import 'api.dart';

final _stockServiceId = Services.AuthService.index;
final _stockServiceName = Services.AuthService.name;

class AuthService extends Service {
  AuthService._(
    SearchAlgorithm<Command, int, Comparator> searchAlgorithm,
  ) : super(
            searchAlgorithm: searchAlgorithm,
            serviceId: _stockServiceId,
            serviceName: _stockServiceName);

  factory AuthService.instance() {
    final searchAlgorithm = commandsBinarySearchAlgorithm();
    final instance = AuthService._(searchAlgorithm);
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

  static void _registerBaseCommands(AuthService instance) {
    instance.initCommands(AuthApi.values.length);

    final graphQl = getGraphQlClient();

    // instance.replaceCommandAtIndex(LoadProductFamillies(graphQl));
  }
}
