
import 'package:frontend_app/application/ServiceStore/search_algorithm.dart';

import '../../application/GraphQlHelpers/graphql_utility.dart';
import '../../application/ServiceStore/service_store.dart';
import '../helpers.dart';
import '../services.dart';
import 'Commands/get_user_data.dart';
import 'api.dart';

final _stockServiceId = Services.usersService.index;
final _stockServiceName = Services.usersService.name;

class UserService extends Service {
  UserService._(
    SearchAlgorithm<Command, int, Comparator> searchAlgorithm,
  ) : super(
            searchAlgorithm: searchAlgorithm,
            serviceId: _stockServiceId,
            serviceName: _stockServiceName);

  factory UserService.instance() {
    final searchAlgorithm = commandsBinarySearchAlgorithm();
    final instance = UserService._(searchAlgorithm);
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

  static void _registerBaseCommands(UserService instance) {
    instance.initCommands(UserApi.values.length);

    final graphQl = getGraphQlClient();
    instance.replaceCommandAtIndex(GetUserData(graphQl));
  }
}
