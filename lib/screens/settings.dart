import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  final String linkedinUrl = "https://www.linkedin.com/in/cangur/";
  final String githubUrl = "https://github.com/cvngur";
  final String twitterUrl = "https://twitter.com/CodeEmAll";

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

  static String routeName = '/settings';
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
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                icon: Icon(Icons.home),
              ),
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Geliştirici Hakkında"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Can Gür"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('Linkedin'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {
                    openWebView(linkedinUrl);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Github'),
                    color: Colors.grey,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: () {
                      openWebView(githubUrl);
                    },
                  ),
                ),
                RaisedButton(
                  child: Text('Twitter'),
                  color: Colors.blue[200],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {
                    openWebView(twitterUrl);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Versiyon"),
            ),
            Text("1.0.0"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.red,
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
              ),
            )
          ],
        )));
  }
}
