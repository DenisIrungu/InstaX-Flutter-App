part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();
}
class AuthenticationUserChanged extends AuthenticationEvent{
  final User? user;

  const AuthenticationUserChanged(this.user);
  @override
 
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticationLogOutRequest extends AuthenticationEvent{
  @override

  List<Object?> get props => throw UnimplementedError();
}
