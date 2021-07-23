import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/models/user_model.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  
  HomePageController(this.moviesRepository);

  var user = UserModel().obs;
  var loading = false.obs;
  MoviesRepository moviesRepository;
  final listMovies = <MovieModel>[].obs;
  
  @override
  Future<void> onInit() async{
    super.onInit();
    user.value = Get.arguments;
    _loadMovies();
  }

  Future _loadMovies() async{
    loading.value = true;
    listMovies.clear();
    try {
      final response = await moviesRepository.getMovies();
      listMovies.addAll(response);
    } catch (e) {
      debugPrint(e.toString());
    }
    loading.value = false;
  }
}