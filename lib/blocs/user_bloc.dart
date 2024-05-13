import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/events/user_event.dart';
import 'package:bloc_practice/models/user_model.dart';
import 'package:bloc_practice/repositories/user_repository.dart';
import 'package:bloc_practice/states/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UesrsEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersInitialFetchUsers>(usersInitialFetchUsers);
  }

  FutureOr<void> usersInitialFetchUsers(
      UsersInitialFetchUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      List<User> users = await UserRepository.fetchUsers();
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(UsersError(errorMessage: "Failed to fetch users:\n $e"));
    }
  }
}
