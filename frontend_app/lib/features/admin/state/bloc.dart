import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/admin/state/events.dart';
import 'package:frontend_app/features/admin/state/state.dart';

class AdminBloc extends Bloc<AdminEvents,AdminState>{
  AdminBloc(super.initialState){
    on<RegisterUsersFromExcel>(_registerUserFromExcel);
    on<LoadUsers>(_loadUsers);
    on<ViewStats>(_viewStats);
  }


  FutureOr<void> _registerUserFromExcel(RegisterUsersFromExcel event, Emitter<AdminState> emit) {
  }

  FutureOr<void> _loadUsers(LoadUsers event, Emitter<AdminState> emit) {
  }

  FutureOr<void> _viewStats(event, Emitter<AdminState> emit) {
  }
}