import 'package:devflix/app/data/models/user_model.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  UserModel user = Get.arguments;
  MoviesRepository moviesRepository;
  final List<MovieModel> listMovies = [];
  
  HomePageController(this.moviesRepository);
  

  Future _loadMovies() async{
    listMovies.clear();
    try {
      final response = await moviesRepository.getMovies();
      listMovies.addAll(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}