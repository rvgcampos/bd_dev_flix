import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/usuario_sistema_model.dart';
import 'package:devflix/app/modules/home/home_page.dart';
import 'package:devflix/app/modules/users/users_controller.dart';
import 'package:devflix/app/modules/users/users_page.dart';
import 'package:devflix/app/modules/users_edit/users_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTile extends GetView<UsersController> {
  final UsuarioSistemaModel usuario;
  UserTile(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      usuario.nome!,
                      style: TextStyle(fontSize: 18, color: AppColors.contrast),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.darkBlue,
                                    title: Text(
                                      'Deseja realmente excluir?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller
                                              .deletarUsuario(usuario.id!);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Sim'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Não'),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(UsersEditPage(true, usuario));
                            //  Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) {
                            //       return UsersEditPage(
                            //         true,
                            //         usuario,
                            //       );
                            //     },
                            //   ),
                            // );
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
