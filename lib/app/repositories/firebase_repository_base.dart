import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gofast/app/interfaces/firebase_repository_base_interface.dart';
import 'package:flutter_gofast/app/models/base_model.dart';


class FirebaseRepositoyBase<Model extends BaseModel>
    implements IFirebaseRepositoryBaseInterface<Model> {
  FirebaseRepositoyBase({this.fromMap, this.collection}) {
    collection ?? '${Model.toString().toLowerCase()}s';
    collectionReference = Firestore.instance.collection(collection);
  }

  final Model Function(DocumentSnapshot document) fromMap;

  String collection;

  CollectionReference collectionReference;

  @override
  Future<String> add(Model model) async {
    model.setCreateTime();
    model.setUpdateTime();
    var collection = collectionReference;
    var document = await collection.add(model.toMap());
    return document.documentID;
  }

  @override
  Future<void> update(Model model) async {
    model.setUpdateTime();
    var collection = collectionReference;
    await collection.document(model.documentId()).updateData(model.toMap());
  }

  @override
  Future<void> disable(Model model) async {
    model.disableDocument();
    update(model);
  }

  @override
  Future<void> enable(Model model) async {
    model.enableDocument();
    update(model);
  }

  @override
  Future<void> delete(String documentId) async {
    var collection = collectionReference;
    await collection.document(documentId).delete();
  }

  @override
  Future<Model> getById(String documentId) async {
    var collection = collectionReference;
    var snapshot = await collection.document(documentId).get();
    return fromMap(snapshot);
  }

  @override
  Future<List<Model>> getAll() async {
    var collection = collectionReference;
    List<Model> list = [];
    var querySnapshot = await collection.getDocuments();
    await querySnapshot.documents.forEach((element) {
      list.add(fromMap(element));
    });

    return await list;
  }

  @override
  CollectionReference filter() {
    return collectionReference;
  }

  @override
  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentList) {
    List<Model> list = [];
    documentList.forEach((element) {
      list.add(fromMap(element));
    });
    return list;
  }
}
