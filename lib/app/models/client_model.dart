import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class Client extends BaseModel {

  String name;
  String cpf;
  String email;

  Client({this.name, this.cpf, this.email});

  Client.fromMap(DocumentSnapshot document) {
    fromBaseMap(document);
    name = document.data["name"];
    cpf = document.data["cpf"];
    email = document.data["email"];
  }

  @override
  Map toMap() {
    var map = <String, dynamic>{};
    map.addAll(toBaseMap());
    map['name'] = name;
    map['cpf'] = cpf;
    map['email'] = email;  
    return map;
  }
}