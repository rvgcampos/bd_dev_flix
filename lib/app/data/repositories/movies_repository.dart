import 'package:devflix/app/data/datasource/movies_datasource.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MoviesRepository{

  MoviesDatasource _datasource;
  MoviesRepository(this._datasource);

  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> list;
    try {
      list = await _datasource.searchMovies();
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteMovie(String id) async {
    try {
      await _datasource.deleteMovie(id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
