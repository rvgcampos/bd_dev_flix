import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/user_model.dart';
import 'package:devflix/app/data/models/usuario_sistema_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  var usuarios = <UsuarioSistemaModel>[].obs;
  var loading = false.obs;

  var nomeController = TextEditingController();
  var loginController = TextEditingController();
  var senhaController = TextEditingController();
  var ehAdministrador = false.obs;

  var user = UserModel().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    user.value = Get.arguments;
    await buscarUsuarios();
  }

  buscarUsuarios() async {
    loading.value = true;
    usuarios.value = [];

    var usuariosFire = await _firestore.collection('Usuario_Sistema').get();
    for (var usuario in usuariosFire.docs) {
      var usuarioData = usuario.data();
      var usuarioMap = <String, dynamic>{};
      usuarioMap['id'] = usuario.id;
      usuarioMap['login'] = usuarioData['login'];
      usuarioMap['senha'] = usuarioData['senha'];
      usuarioMap['nome'] = usuarioData['nome'];
      var usuarioModel = UsuarioSistemaModel.fromJson(usuarioMap);
      usuarios.add(usuarioModel);
    }

    loading.value = false;
  }

  adicionarUsuario() async {
    var usuarioMap = <String, dynamic>{};
    usuarioMap['login'] = loginController.text;
    usuarioMap['senha'] = senhaController.text;
    usuarioMap['nome'] = nomeController.text;
    var usuarioSistema =
        await _firestore.collection('Usuario_Sistema').add(usuarioMap);
    if (ehAdministrador.value) {
      await _firestore
          .collection('administrador')
          .add({'login': usuarioSistema});
    } else {
      await _firestore.collection('operador').add({'login': usuarioSistema});
    }

    loginController.text = '';
    senhaController.text = '';
    nomeController.text = '';
    buscarUsuarios();
  }

  atualizarUsuario(id) async {
    var usuarioMap = <String, dynamic>{};
    usuarioMap['login'] = loginController.text;
    usuarioMap['senha'] = senhaController.text;
    usuarioMap['nome'] = nomeController.text;
    await _firestore.collection('Usuario_Sistema').doc(id).set(usuarioMap);

    loginController.text = '';
    senhaController.text = '';
    nomeController.text = '';
    buscarUsuarios();
  }

  deletarUsuario(id) async {
    await _firestore.collection('Usuario_Sistema').doc(id).delete();
    buscarUsuarios();
  }
}
