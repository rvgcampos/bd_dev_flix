import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/titulo_model.dart';

class MovieModel {
  MovieModel({
    this.id,
    required this.dataLancamento,
    required this.tituloModel,
    required this.image
  });

  int? id;
  DateTime dataLancamento;
  TituloModel tituloModel;
  String image;

  factory MovieModel.fromDocument(DocumentSnapshot document) => MovieModel(
    id: document["id"],
    dataLancamento: DateTime.parse(document["data_lancamento"]),
    tituloModel: TituloModel.fromDocument(document["idTitulo"]),
    image: document["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data_lancamento": dataLancamento,
    "idTitulo": tituloModel,
    "image": image,
  };
}