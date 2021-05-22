import 'package:devflix/screens/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularComponent extends StatelessWidget {
  final String titulo;
  final String imageUrl;
  PopularComponent(this.titulo, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetail());
      },
      child: Container(
        // height: 200,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/popular/${imageUrl}.jpg',
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                titulo,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
