import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class Client extends BaseModel {
  String name;
  String cpf;
  String email;

  @override
  Client({this.name, this.cpf, this.email});

  @override
  Client.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    name = document.data["name"];
    cpf = document.data["cpf"];
    email = document.data["email"];
  }

  @override
  Map toMap(){
    var map = super.toMap();
    map['name'] = name;
    map['cpf'] = cpf;
    map['email'] = email;
    return map;
  }
}
