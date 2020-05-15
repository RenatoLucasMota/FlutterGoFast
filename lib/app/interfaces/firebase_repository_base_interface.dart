import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gofast/app/interfaces/base_model_interface.dart';

abstract class IFirebaseRepositoryBaseInterface<
    Model extends IBaseModelInterface> {

  Future<String> add(Model model);

  Future<void> update(Model model);

  Future<void> disable(Model model);

  Future<void> enable(Model model);

  Future<void> delete(String documentId);

  Future<Model> getById(String documentId);

  Future<List<Model>> getAll();

  CollectionReference filter();

  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentList);
}
