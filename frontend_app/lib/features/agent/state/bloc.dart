
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentState.initial());
}