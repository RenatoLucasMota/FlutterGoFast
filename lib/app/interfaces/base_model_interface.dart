import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBaseModelInterface {
  String documentId(); 

  Map toMap(); 

  IBaseModelInterface();

  IBaseModelInterface.fromMap(DocumentSnapshot document);

  void disableDocument();

  void enableDocument();

  void setCreateTime();

  void setUpdateTime();
}