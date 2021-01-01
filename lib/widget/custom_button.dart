import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String url;
  final Color color;
  final String text;
  const CustomButton({
    this.url,
    this.color,
    this.text,
  });

  Future<void> openWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: true,
        enableJavaScript: true,
      );
      return;
    } else {
      print("Başaramadık");
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        openWebView(url);
      },
    );
  }
}
