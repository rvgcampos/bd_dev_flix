import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/models/titulo_model.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularComponent extends StatelessWidget {
  final TituloModel tituloModel;
  final String imageUrl;
  PopularComponent(this.tituloModel, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.MOVIEDETAIL, arguments: [tituloModel,imageUrl]);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tituloModel.titulo!,
                style: TextStyle(fontSize: 18, color: AppColors.contrast),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                  Icon(Icons.star, color: AppColors.yellow),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
