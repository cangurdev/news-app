import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:news_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static String routeName = '/login';

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
              InputField(
                prefixIcon: Icon(Icons.mail_outline),
                labelText: "E-mail",
                textInputType: TextInputType.emailAddress,
                textEditingController: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Parola",
                obscure: true,
                textEditingController: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        'Hesabın Yok Mu?',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () async {
                        try {
                          await context.read<AuthService>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                          Navigator.of(context).pushReplacementNamed('/home');
                        } catch (e) {
                          print(e.message);
                        }
                      },
                      child: Text("Giriş Yap"),
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
