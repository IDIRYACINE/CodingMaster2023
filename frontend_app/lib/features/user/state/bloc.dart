import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/user/state/events.dart';
import 'package:frontend_app/features/user/state/state.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc(super.initialState){
    on<LoadUserData>(_loadUserData);
    on<OnUserLoaded>(_onUserLoaded);
  }

  FutureOr<void> _loadUserData(LoadUserData event, Emitter<UserState> emit) {
  }

  FutureOr<void> _onUserLoaded(OnUserLoaded event, Emitter<UserState> emit) {
  }
}