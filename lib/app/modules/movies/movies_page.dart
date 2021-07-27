import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/modules/movies/movies_controller.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'components/popular_component.dart';

class MoviesPage extends GetView<MoviesPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Filmes',
                        style:
                            TextStyle(color: AppColors.contrast, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: controller.loadMovies,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Pages.MOVIESEDIT, arguments: null);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.lightBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text('Adicionar'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Obx(() => Container(
                    child: controller.loading.value
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            children: controller.listMovies
                                .map((element) => PopularComponent(
                                    element, controller.deleteMovie, element.id!))
                                .toList()),
                  ))
            ],
          ),
        ));
  }
}
