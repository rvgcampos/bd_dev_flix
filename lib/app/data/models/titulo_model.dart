import 'genero_model.dart';

class TituloModel {
    TituloModel({
        this.generoModel,
        this.sinopse,
        this.ano,
        this.titulo,
    });

    GeneroModel? generoModel;
    String? sinopse;
    int? ano;
    String? titulo;

    factory TituloModel.fromJson(Map<String, dynamic> json) => TituloModel(
        generoModel: GeneroModel.fromJson(json["genero"]),
        sinopse: json["sinopse"],
        ano: json["ano"],
        titulo: json["titulo"],
    );

    Map<String, dynamic> toJson() => {
        "genero": generoModel!.toJson(),
        "sinopse": sinopse,
        "ano": ano,
        "titulo": titulo,
    };
}