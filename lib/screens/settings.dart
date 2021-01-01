import 'package:flutter/material.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:news_app/widget/custom_button.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  final String linkedinUrl = "https://www.linkedin.com/in/cangur/";
  final String githubUrl = "https://github.com/cvngur";
  final String twitterUrl = "https://twitter.com/CodeEmAll";

  static String routeName = '/settings';

  void showLicensePage({
    @required BuildContext context,
    String applicationName,
    String applicationVersion,
    Widget applicationIcon,
    String applicationLegalese,
    bool useRootNavigator = false,
  }) {
    assert(context != null);
    assert(useRootNavigator != null);
    Navigator.of(context, rootNavigator: useRootNavigator)
        .push(MaterialPageRoute<void>(
      builder: (BuildContext context) => LicensePage(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
      ),
    ));
  }

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
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Can Gür"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  url: linkedinUrl,
                  color: Colors.blue,
                  text: 'Linkedin',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    url: githubUrl,
                    color: Colors.grey,
                    text: 'Github',
                  ),
                ),
                CustomButton(
                  url: twitterUrl,
                  color: Colors.blue[200],
                  text: 'Twitter',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Versiyon"),
            ),
            Text("1.0.0"),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("Lisanslar"),
            ),
            RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {
                showLicensePage(context: context);
              },
              child: Text("Görüntüle"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
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
