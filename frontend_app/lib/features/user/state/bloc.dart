
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/user/state/events.dart';
import 'package:frontend_app/features/user/state/state.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc():super(UserState.initial()){
    on<NavigateToScreenEvent>(_navigateToScreen);
    on<UpdateUserEvent>(_updateUser);
  }

  FutureOr<void> _navigateToScreen(NavigateToScreenEvent event, Emitter<UserState> emit) {
    emit(state.copyWith(selectedIndex: event.screenIndex));
  
  }

  FutureOr<void> _updateUser(UpdateUserEvent event, Emitter<UserState> emit) {

  }
}