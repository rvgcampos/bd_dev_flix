import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/usuario_sistema_model.dart';
import 'package:devflix/app/modules/users/components/user_tile.dart';
import 'package:devflix/app/modules/users/users_controller.dart';
import 'package:devflix/app/modules/users_edit/users_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Obx(() => Text(
                'Olá, ${controller.user.value.primeiroNome}!',
                style: TextStyle(color: AppColors.contrast, fontSize: 26),
              )),
        ),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Obx(
        () => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  color: AppColors.darkBlue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITULO: CATEGORIAS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              'Usuários',
                              style: TextStyle(
                                  color: AppColors.contrast, fontSize: 18),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 15),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.buscarUsuarios();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 15),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                      UsersEditPage(
                                        false,
                                        new UsuarioSistemaModel(),
                                      ),
                                    );

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) {
                                    //       return UsersEditPage(
                                    //         false,
                                    //         new UsuarioSistemaModel(),
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text('Adicionar'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 330,
                        child: Obx(
                          () => ListView(
                            scrollDirection: Axis.vertical,
                            children: controller.usuarios
                                .map((usuario) => UserTile(usuario))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
