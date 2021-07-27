import 'dart:convert';

import 'package:devflix/app/data/models/titulo_model.dart';

SeriesModel seriesModelFromJson(String str) => SeriesModel.fromJson(json.decode(str));

String seriesModelToJson(SeriesModel data) => json.encode(data.toJson());

class SeriesModel {
    SeriesModel({
        this.id,
        this.image,
        this.anoFim,
        this.tituloModel,
    });

    String? id;
    String? image;
    int? anoFim;
    TituloModel? tituloModel;

    factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        id: json["id"],
        image: json["image"],
        anoFim: json["ano_fim"],
        tituloModel: TituloModel.fromJson(json["idTitulo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "ano_fim": anoFim,
        "idTitulo": tituloModel!.toJson(),
    };
}
