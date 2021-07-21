import 'package:cloud_firestore/cloud_firestore.dart';

class GeneroModel {
  GeneroModel({
    this.id,
    required this.genero
  });

  int? id;
  String genero;


  factory GeneroModel.fromDocument(DocumentSnapshot document) => GeneroModel(
    id: document["id"],
    genero: document["genero"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "genero": genero,
  };
}