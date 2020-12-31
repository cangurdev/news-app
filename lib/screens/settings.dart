import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('News App'),
              )
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Geliştirici Hakkında"),
            Text("Can Gür"),
            Text("Versiyon"),
            Text("1.0.0"),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                try {
                  await context.read<AuthService>().signOut();
                  Navigator.of(context).pushReplacementNamed('/login');
                } catch (e) {}
              },
              child: Text("Çıkış yap"),
            )
          ],
        )));
  }
}
