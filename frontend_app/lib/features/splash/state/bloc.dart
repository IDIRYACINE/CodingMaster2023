
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/admin/state/state.dart';

import 'events.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminState());
}