import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FBController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      unawaited(_userCredential.user!.sendEmailVerification());
      return true;
    } catch (e) {}
    return false;
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential.user!.emailVerified) {
        return true;
      }
    } catch (e) {}
    return false;
  }

  void _controlFirebaseAuthException(FirebaseAuthException exception) {}
}
