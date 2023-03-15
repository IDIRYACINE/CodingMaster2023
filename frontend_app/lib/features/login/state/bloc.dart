
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc(super.initialState){
    on<LoginWithCredentials>(_loginCredentials);
    on<LoginWithQr>(_loginQr);
  }


  FutureOr<void> _loginQr(LoginWithQr event, Emitter<LoginState> emit) {
  }

  FutureOr<void> _loginCredentials(LoginWithCredentials event, Emitter<LoginState> emit) {
  }
}