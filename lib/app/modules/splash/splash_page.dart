import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_controller.dart';
import '../../core/interfaces/auth_repository_interface.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Firestore.instance
        .collection('books')
        .document()
        .setData({'title': 'title', 'author': 'author'});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Theme Dark'),
            onPressed: () {
              Modular.get<AppController>().setThemeData(ThemeMode.dark);
            },
          ),
          RaisedButton(
            child: Text('Theme Ligth'),
            onPressed: () {
              Modular.get<AppController>().setThemeData(ThemeMode.light);
            },
          ),
          RaisedButton(
            child: Text('Login Google'),
            onPressed: () async {
              await Modular.get<IAuthRepository>()
                  .doLoginGoogle()
                  .then((result) {
                if (result.success) {
                  print(result.message);
                } else {
                  print(result.message);
                }
              });
            },
          )
        ],
      ),
    ));
  }
}
