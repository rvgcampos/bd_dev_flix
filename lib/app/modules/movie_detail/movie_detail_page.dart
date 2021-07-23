import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/modules/movie_detail/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Detail Movie',
          style: TextStyle(color: AppColors.contrast, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkBlue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Obx(() => Image.network(
                      controller.imageUrl.value,
                      fit: BoxFit.cover,
                      height: 350,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              controller.tituloModel.value.titulo!,
                              style: TextStyle(
                                color: AppColors.contrast,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ID: 115152 | Duração: 1h32min',
                          style: TextStyle(
                            color: AppColors.contrast.withAlpha(80),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // CATEGORIAS
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.grey.withAlpha(40),
                                border:
                                    Border.all(color: AppColors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Obx(() => Text(
                                    controller
                                        .tituloModel.value.generoModel!.genero,
                                    style: TextStyle(
                                      color: AppColors.contrast,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        // Sinopse
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sinopse',
                          style: TextStyle(
                            color: AppColors.contrast,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 350,
                          height: 150,
                          child: SingleChildScrollView(
                            child: Obx(() => Text(
                                  controller.tituloModel.value.sinopse!,
                                  style: TextStyle(
                                      color: AppColors.contrast.withAlpha(80),
                                      fontSize: 18),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
