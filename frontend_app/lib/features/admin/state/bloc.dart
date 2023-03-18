import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/admin/state/state.dart';

import 'events.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminState.initial()) {
    on<LoadUserStatsEvent>(_loadUserStats);
    on<ImportUsersEventResult>(_importUsersEventResult);
    on<LoadUsersEvent>(_loadUsers);
  }

  FutureOr<void> _loadUserStats(
      LoadUserStatsEvent event, Emitter<AdminState> emit) {
    emit(state.copyWith(
      userStats: event.userStats,
    ));
  }

  FutureOr<void> _importUsersEventResult(
      ImportUsersEventResult event, Emitter<AdminState> emit) {
    emit(state.copyWith(
      isImportingUsers: event.isImportingUsers,
    ));
  }

  FutureOr<void> _loadUsers(LoadUsersEvent event, Emitter<AdminState> emit) {
    emit(state.copyWith(
      users: event.users,
    ));
  }
}
