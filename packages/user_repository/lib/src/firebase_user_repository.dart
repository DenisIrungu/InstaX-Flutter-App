import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepository implements UserRepository {
  //Constructor
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  //class parameter
  final FirebaseAuth _firebaseAuth;
//Sign Up Method
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      myUser = myUser.copyWith(id: user.user!.uid);
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  //Sign In Method
  @override
  Future<void> signIn(String email, String password) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password);

    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
//LogOut Method
  @override
  Future<void> logOut() async{
    try{
      await _firebaseAuth.signOut();
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
//Reset Password Method
  @override
  Future<void> resetPassword(String email) async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(e){
      log(e.toString());
      rethrow;
    }

  }
}
