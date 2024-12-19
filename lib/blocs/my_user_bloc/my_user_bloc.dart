import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository _userRepository;

  MyUserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const MyUserState.loading()) {
    on<GetMyUser>((event, emit) async {
      try {
        MyUser myUser = await _userRepository.getUser(event.myUserId);
        emit(MyUserState.success(myUser));
      } catch (e) {
        emit(const MyUserState.failure());
      }
    });
  }
}
