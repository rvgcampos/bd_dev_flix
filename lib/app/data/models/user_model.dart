import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  
  UserModel({
    required this.email,
    required this.primeiroNome,
    required this.sobrenome
  });

  String email;
  String primeiroNome;
  String sobrenome;

  factory UserModel.fromDocument(DocumentSnapshot document) => UserModel(
    email: document["email"],
    primeiroNome: document["primeiroNome"],
    sobrenome: document["sobrenome"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "primeiroNome": primeiroNome,
    "sobrenome": sobrenome,
  };
}