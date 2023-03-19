import 'dart:io';

void generateEventFile(String eventName, String eventPath) {
  var eventFile = File(eventPath);
  eventFile.writeAsStringSync('''
import 'package:angular2/core.dart';

class $eventName extends BaseEvent{

}
''');
}
