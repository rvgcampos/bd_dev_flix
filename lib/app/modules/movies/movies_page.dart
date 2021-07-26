import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/modules/movies/movies_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'components/popular_component.dart';

class MoviesPage extends GetView<MoviesPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            'Olá, Renato!',
            style: TextStyle(color: AppColors.contrast, fontSize: 26),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/perfil/perfil.jpg'),
              backgroundColor: AppColors.transparent,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      'Filmes',
                      style: TextStyle(color: AppColors.contrast, fontSize: 18),
                    ),
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
              ),
              Container(
                height: 330,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    PopularComponent('La Casa de Papel', 'casa_papel'),
                    PopularComponent(
                        'Velozes e Furiosos 9', 'velozes_furiosos'),
                    PopularComponent('John Wick 3', 'john_wick'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
