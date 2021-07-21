import 'package:cloud_firestore/cloud_firestore.dart';

import 'genero_model.dart';

class TituloModel {
  TituloModel({
    this.id,
    required this.ano,
    required this.generoModel,
    required this.sinopse,
    required this.titulo
  });

  int? id;
  int ano;
  GeneroModel generoModel;
  String sinopse;
  String titulo;

  factory TituloModel.fromDocument(DocumentSnapshot document) => TituloModel(
    id: document["id"],
    ano: document["ano"],
    generoModel: GeneroModel.fromDocument(document["idGenero"]),
    sinopse: document["sinopse"],
    titulo: document["titulo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ano": ano,
    "idGenero": generoModel,
    "sinopse": sinopse,
    "titulo": titulo,
  };
}