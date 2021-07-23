import 'dart:convert';

import 'package:devflix/app/data/models/titulo_model.dart';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    MovieModel({
        this.image,
        this.dataLancamento,
        this.tituloModel,
    });

    String? image;
    String? dataLancamento;
    TituloModel? tituloModel;

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        image: json["image"],
        dataLancamento: json["data_lancamento"],
        tituloModel: TituloModel.fromJson(json["idTitulo"]),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "data_lancamento": dataLancamento,
        "idTitulo": tituloModel!.toJson(),
    };
}
