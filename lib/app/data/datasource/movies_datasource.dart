

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/movie_model.dart';

class MoviesDatasource{
  final _firestore = FirebaseFirestore.instance;

  Future<List<MovieModel>> searchMovies() async {
    var result = await _firestore.collection('filme').get();
    return result.docs.map(
      (item) => MovieModel.fromDocument(item))
      .toList();
  }
}
