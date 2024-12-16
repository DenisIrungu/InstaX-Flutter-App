import 'package:user_repository/user_repository.dart';

abstract class UserRepository{
  // ignore: non_constant_identifier_names
  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);
  
}