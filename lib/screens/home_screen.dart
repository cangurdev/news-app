import 'package:flutter/material.dart';
import 'package:news_app/screens/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            Image.asset(
              'assets/images/icon.png',
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Haberler'),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}
