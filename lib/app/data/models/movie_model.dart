import 'dart:convert';

import 'package:devflix/app/data/models/titulo_model.dart';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    MovieModel({
        this.id,
        this.image,
        this.dataLancamento,
        this.tituloModel,
    });

    String? id;
    String? image;
    DateTime? dataLancamento;
    TituloModel? tituloModel;

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        image: json["image"],
        dataLancamento: DateTime.tryParse(json["data_lancamento"]),
        tituloModel: TituloModel.fromJson(json["idTitulo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "data_lancamento": dataLancamento,
        "idTitulo": tituloModel!.toJson(),
    };
}
