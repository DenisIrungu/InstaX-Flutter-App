part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFairure extends SignInState {
  final String? massage;

  const SignInFairure({this.massage});
}

class SignInProceeding extends SignInState {}
