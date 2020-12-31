import 'package:flutter/material.dart';
import 'package:news_app/theme/size_config.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/logo.png"))),
        )
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Login(),
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: animation, curve: Curves.fastLinearToSlowEaseIn),
            ),
            child: child,
          ));
}
