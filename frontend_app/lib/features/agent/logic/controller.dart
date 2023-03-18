import 'package:frontend_app/infrastracture/services.dart';

class QrWidgetController {
  void onQrScan(String qr) {
    ServicesGateway.instance().agentService.verifyUser(qr).then((response) {});
  }
}
