import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:news_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  static String routeName = '/register';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 64.0),
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 100,
                ),
              ),
              InputField(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                ),
                labelText: "E-mail",
                textInputType: TextInputType.emailAddress,
                textEditingController: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                labelText: "Password",
                obscure: true,
                textEditingController: passwordController,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        child: Text(
                          'Zaten Bir Hesabın Var Mı?',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/login');
                        }),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                          Navigator.of(context).pushReplacementNamed('/home');
                        } on FirebaseAuthException catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  title:
                                      Text('email veya parola boş bırakılamaz'),
                                );
                              });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text("Register"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
