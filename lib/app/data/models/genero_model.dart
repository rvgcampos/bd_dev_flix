class GeneroModel {
  GeneroModel({
    this.id,
    required this.genero
  });

  int? id;
  String genero;


  factory GeneroModel.fromJson(Map<String, dynamic> json) => GeneroModel(
    id: json["id"],
    genero: json["genero"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "genero": genero,
  };
}