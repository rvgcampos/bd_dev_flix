import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryComponent(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(40),
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/categorias/${imageUrl}.png'),
            backgroundColor: Colors.transparent,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
