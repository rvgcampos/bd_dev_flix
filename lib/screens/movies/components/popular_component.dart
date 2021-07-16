import 'package:devflix/core/theme/app_colors.dart';
import 'package:devflix/routes/pages.dart';
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
        Get.toNamed(Pages.MOVIESEDIT);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/popular/$imageUrl.jpg',
                  fit: BoxFit.cover,
                  height: 60,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        titulo,
                        style:
                            TextStyle(fontSize: 18, color: AppColors.contrast),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColors.yellow),
                          Text(
                            '8.1',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
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
      ),
    );
  }
}
