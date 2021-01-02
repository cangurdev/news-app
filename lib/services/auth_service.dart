import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> login(
      {String email, String password, BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        dialog(context, 'Kullanıcı Bulunamadı!');
      } else if (e.code == 'wrong-password') {
        dialog(context, 'Hatalı Parola!');
      } else {
        dialog(context, 'Hatalı bir giriş yaptınız!');
      }
    }
  }

  Future<void> signUp(
      {String email, String password, BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        dialog(context, 'Girdiğiniz emaile ait bir hesap zaten mevcut.');
      } else {
        dialog(context, 'email veya parola boş bırakılamaz');
      }
    } catch (e) {
      print(e);
    }
  }

  Future dialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: Colors.red[300],
          );
        });
  }
}
