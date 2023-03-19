

import 'package:frontend_app/infrastracture/authService/service.dart';
import 'package:services_bus/services_bus.dart';
import 'graphQlService/graphql_service.dart';

class ServicesStore extends BaseStore{

  static ServicesStore? _instance;

  ServicesStore._({required int storeId}):super(
storeId:storeId,
  ){
    _registerBaseServices();
  }

  factory ServicesStore.instance(){
    _instance ??= ServicesStore._(storeId: 0);
    return _instance!;
  }
  
  void _registerBaseServices() {

    final graphQlClient = buildGraphQlClient();
    
    final authService = AuthService(graphQlClient, serviceId: servicesCurrId);

    services.add(authService);
  }


}