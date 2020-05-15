import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gofast/app/models/user_model.dart';
import 'package:flutter_gofast/app/repositories/firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<User> {
  @override
  String get collection => 'users';

  @override
  User Function(DocumentSnapshot document) get fromMap =>
      (document) => User.fromMap(document);
}

