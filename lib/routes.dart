import 'package:flutter/widgets.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login.dart';
import 'package:news_app/screens/register.dart';
import 'package:news_app/screens/settings.dart';
import 'package:news_app/screens/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  Splash.routeName: (context) => Splash(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Settings.routeName: (context) => Settings(),
};
