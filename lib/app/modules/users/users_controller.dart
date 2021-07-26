import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/usuario_sistema_model.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final usuarios = <UsuarioSistemaModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await buscarUsuarios();
  }

  buscarUsuarios() async {
    var usuariosFire = await _firestore.collection('Usuario_Sistema').get();
    for (var usuario in usuariosFire.docs) {
      var usuarioData = usuario.data();
      var usuarioMap = <String, dynamic>{};
      usuarioMap['login'] = usuarioData['login'];
      usuarioMap['senha'] = usuarioData['senha'];
      usuarioMap['nome'] = usuarioData['nome'];
      print('usuarios');
      var usuarioModel = UsuarioSistemaModel.fromJson(usuarioMap);
      print('usuarios');
      usuarios.add(usuarioModel);
    }
  }
}
