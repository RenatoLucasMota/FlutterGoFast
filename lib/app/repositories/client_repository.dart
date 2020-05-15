

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gofast/app/models/client_model.dart';

import 'firebase_repository_base.dart';

class ClientRepository extends FirebaseRepositoyBase<Client> {
  @override
  String get collection => 'clients';

  @override
  Client Function(DocumentSnapshot document) get fromMap =>
      (document) => Client.fromMap(document);
}
