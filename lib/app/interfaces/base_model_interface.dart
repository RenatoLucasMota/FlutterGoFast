import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBaseModelInterface {
  String documentId(); 

  Map toMap(); 

  Map toBaseMap();

  void fromBaseMap(DocumentSnapshot document);

  void disableDocument();

  void enableDocument();

  void setCreateTime();

  void setUpdateTime();
}