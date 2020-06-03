import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gofast/app/views/widgets/scroll_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {
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
        title: Text("Registrar-se"),
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
          Observer(builder: (context) {
            return RaisedButton(
              onPressed: _authController.enableButton
                  ? () async {
                      await _authController.doRegister().catchError(
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
                "REGISTRAR-SE",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ],
      ),
    );
  }
}
