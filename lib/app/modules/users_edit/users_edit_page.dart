import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/usuario_sistema_model.dart';
import 'package:devflix/app/modules/home/home_page.dart';
import 'package:devflix/app/modules/users/users_controller.dart';
import 'package:devflix/app/modules/users_edit/components/field_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersEditPage extends GetView<UsersController> {
  final bool atualiza;
  final UsuarioSistemaModel usuario;
  UsersEditPage(this.atualiza, this.usuario);

  @override
  Widget build(BuildContext context) {
    if (atualiza) {
      controller.nomeController.text = usuario.nome!;
      controller.senhaController.text = usuario.senha!;
      controller.loginController.text = usuario.login!;
    }
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: 60,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'DevFlix',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.darkBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    child: Text(
                      'Editar/Atualizar Usuário',
                      style: TextStyle(color: AppColors.contrast, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFieldApp(
                    hintText: 'Nome',
                    textEditingController: controller.nomeController,
                  ),
                  TextFieldApp(
                    hintText: 'Login',
                    textEditingController: controller.loginController,
                  ),
                  TextFieldApp(
                    hintText: 'Senha',
                    textEditingController: controller.senhaController,
                  ),
                  if(!atualiza)
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'É administrador?',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Checkbox(
                          checkColor: Colors.blue,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: controller.ehAdministrador.value,
                          onChanged: (val) {
                            controller.ehAdministrador.value = val!;
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (atualiza) {
                    controller.atualizarUsuario(usuario.id);
                  } else {
                    controller.adicionarUsuario();
                  }
                  Get.off(HomePage());
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: AppColors.contrast,
                  primary: AppColors.blue[800],
                  minimumSize: Size(320, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(color: AppColors.contrast, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
