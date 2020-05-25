import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/controllers/register/register_controller.dart';
import 'package:flutter_gofast/app/views/widgets/scroll_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
            decoration: InputDecoration(hintText: "Seu email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Sua senha"),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: _height * 0.06,
          ),
          RaisedButton(
            onPressed: () {},
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
