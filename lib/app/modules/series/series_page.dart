import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/genero_model.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/models/titulo_model.dart';
import 'package:devflix/app/modules/series/components/popular_component.dart';
import 'package:devflix/app/modules/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesPage extends GetView<UsersController> {
  // const SeriesPage({Key? key}) : super(key: key);
  final loading = false;

  final lista = [
    MovieModel(
      dataLancamento: '10-12-2021',
      image: 'assets/popular/casa_papel.jpg',
      tituloModel: TituloModel(
        ano: 2021,
        sinopse: 'asdasdasda',
        titulo: 'John Wick',
        generoModel: GeneroModel(genero: 'Ação'),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITULO: CATEGORIAS
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Séries',
                      style: TextStyle(color: AppColors.contrast, fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text('Adicionar'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 330,
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: lista
                          .map((element) => PopularComponent(element))
                          .toList()),
            )
          ],
        ),
      ),
    );
  }
}
