
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthState());

}