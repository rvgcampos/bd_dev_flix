class UsuarioSistemaModel {
  UsuarioSistemaModel({this.login, this.senha, this.nome});

  String? login;
  String? senha;
  String? nome;

  factory UsuarioSistemaModel.fromJson(Map<String, dynamic> json) =>
      UsuarioSistemaModel(
        login: json["login"],
        senha: json["senha"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "senha": senha,
        "nome": nome,
      };
}
