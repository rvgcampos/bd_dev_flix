import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/serie_model.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularComponent extends StatelessWidget {
  final SeriesModel serie;
  final Function(String) deleteSerie;
  PopularComponent(this.serie, this.deleteSerie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            InkWell(
                onTap: (){
                Get.toNamed(Pages.SERIESEDIT, arguments: [serie.tituloModel,serie.image]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    serie.image!,
                    fit: BoxFit.cover,
                    height: 60,
                  ),
                ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    serie.tituloModel!.titulo!,
                    style: TextStyle(fontSize: 18, color: AppColors.contrast),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.yellow),
                      Text(
                        '8.1',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Pages.SERIESEDIT, arguments: serie);
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => deleteSerie(serie.id!),
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
    );
  }
}
