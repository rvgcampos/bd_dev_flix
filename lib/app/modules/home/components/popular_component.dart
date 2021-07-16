import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularComponent extends StatelessWidget {
  final String titulo;
  final String imageUrl;
  PopularComponent(this.titulo, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.MOVIEDETAIL);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/popular/$imageUrl.jpg',
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                titulo,
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
