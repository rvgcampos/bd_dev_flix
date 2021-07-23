class UserModel {
  
  UserModel({
    this.email,
    this.primeiroNome,
    this.sobrenome
  });

  String? email;
  String? primeiroNome;
  String? sobrenome;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    primeiroNome: json["primeiro_nome"],
    sobrenome: json["sobrenome"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "primeiroNome": primeiroNome,
    "sobrenome": sobrenome,
  };
}