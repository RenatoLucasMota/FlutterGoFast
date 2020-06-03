import 'package:flutter_gofast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gofast/app/controllers/login/login_controller.dart';
import 'package:flutter_gofast/app/core/localization/app_translate.dart';
import 'package:flutter_gofast/app/views/widgets/scroll_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ScrollWidget(
        children: <Widget>[
          TextField(
            onChanged: _authController.setEmail,
            decoration: InputDecoration(hintText: "Seu email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextField(
            onChanged: _authController.setPassword,
            decoration: InputDecoration(hintText: "Sua senha"),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          Observer(
              name: 'LoginButton',
              builder: (context) {
                return RaisedButton(
                  onPressed: _authController.enableButton
                      ? () async {
                          await _authController.doLoginEmail().catchError(
                            (error) {
                              var scnackbar = SnackBar(
                                content: Text(error.message),
                              );
                              Scaffold.of(context).showSnackBar(scnackbar);
                            },
                          );
                        }
                      : null,
                  child: Text(
                    AppTranslate(context).text('intro.login_now'),
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
          SizedBox(
            height: _height * 0.06,
          ),
          RaisedButton(
            color: Colors.red,
            onPressed: _authController.doLoginGoogle,
            child: Text(
              AppTranslate(context).text('intro.login_google'),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          RaisedButton(
            color: Colors.grey,
            onPressed: controller.doRegister,
            child: Text(
              "REGISTRAR-SE",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
