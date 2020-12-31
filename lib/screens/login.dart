import 'package:flutter/material.dart';
import 'package:news_app/widget/input_field.dart';

class Login extends StatelessWidget {
  static String routeName = '/login';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
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
                labelText: "Password",
                obscure: true,
                textEditingController: passwordController,
              ),
              InkWell(
                child: Text('Not Have An Account?'),
                onTap: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
              RaisedButton(
                onPressed: () {
                  print(emailController.text.trim());
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
