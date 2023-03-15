import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/features/user/state/events.dart';
import 'package:frontend_app/features/user/state/state.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc(super.initialState);
}