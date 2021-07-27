import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPageController extends GetxController {

  MoviesRepository moviesRepository;
  var loading = false.obs;
  final listMovies = <MovieModel>[].obs;

  MoviesPageController(this.moviesRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    loadMovies();
  }

  Future<void> deleteMovie(String? id) async{
    try {
      await moviesRepository.deleteMovie(id!);
      await loadMovies();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future loadMovies() async {
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
