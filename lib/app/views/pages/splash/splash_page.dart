import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/interfaces/firebase_repository_base_interface.dart';
import 'package:flutter_gofast/app/models/client_model.dart';
import 'package:flutter_gofast/app/models/user_model.dart';
import 'package:flutter_gofast/app/repositories/client_repository.dart';
import 'package:flutter_gofast/app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ClientRepository clientRepository;
  String id;
  @override
  void initState() {
    clientRepository = Modular.get<ClientRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: PageView(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Add User'),
                    onPressed: () async {
                      var user = Client(
                          name: 'Renato Mota',
                          cpf: '1121651266',
                          email: 'renato@renato.com',
                          );
                      id = await clientRepository.add(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Update User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      user.name = 'Renato Mota 2';
                      clientRepository.update(user);
                      print(user.name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Disable User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      clientRepository.disable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Enable User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      clientRepository.enable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Delete User'),
                    onPressed: () async {
                      await clientRepository.delete(id);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get All'),
                    onPressed: () async {
                      var list = await clientRepository.getAll();

                      print(list[0].name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get Filter'),
                    onPressed: () async {
                      var list = await clientRepository
                          .filter()
                          .where('name', isEqualTo: 'Renato Mota2')
                          .where('email', isEqualTo: 'renato@renato.com')
                          .orderBy('name', descending: true)
                          .getDocuments()
                          .then((value) => value.documents);
                      clientRepository.fromSnapshotToModelList(list);
                    },
                  ),
                ],
              ),
            ),
            ListView(),
          ],
        ),
      ),
    );
  }
}
