import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularComponent extends StatelessWidget {
  final MovieModel movie;
  // final Function(String?) deleteMovie;
  // PopularComponent(this.movie, this.deleteMovie);
  PopularComponent(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                movie.image!,
                fit: BoxFit.cover,
                height: 60,
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
                    movie.tituloModel!.titulo!,
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
                      Get.toNamed(Pages.MOVIESEDIT, arguments: movie);
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
                    // onTap: () => deleteMovie(movie.id),
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
