class UsuarioSistemaModel {
  UsuarioSistemaModel({this.id, this.login, this.senha, this.nome});

  String? id;
  String? login;
  String? senha;
  String? nome;

  factory UsuarioSistemaModel.fromJson(Map<String, dynamic> json) =>
      UsuarioSistemaModel(
        id: json["id"],
        login: json["login"],
        senha: json["senha"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "senha": senha,
        "nome": nome,
      };
}
