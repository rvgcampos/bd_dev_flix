import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/movie_model.dart';

class MoviesDatasource {
  final _firestore = FirebaseFirestore.instance;

  Future<List<MovieModel>> searchMovies() async {
    var movies = [].cast<MovieModel>();
    await _firestore.collection('filme').get().then((value) {
      value.docs.forEach((element) async {
        final Map<String, dynamic> jsonMovie = {};
        final Map<String, dynamic> jsonIdTitulo = {};
        final Map<String, dynamic> jsonIdGenero = {};
        jsonMovie['id'] = element.id;
        DocumentReference idTitulo = await element.get('idTitulo');
        await idTitulo.get().then((value) async {
          final titulo = value.data() as Map<String, dynamic>;
          await _firestore
              .collection('genero')
              .doc(titulo['idGenero'])
              .get()
              .then((value) {
            jsonIdGenero['genero'] = value.data()!['genero'];
          });
          jsonIdTitulo['genero'] = jsonIdGenero;
          jsonIdTitulo['sinopse'] = titulo['sinopse'];
          jsonIdTitulo['ano'] = titulo['ano'];
          jsonIdTitulo['titulo'] = titulo['titulo'];
          final doc = element.data();
          jsonMovie['image'] = doc['image'];
          Timestamp date = doc['data_lancamento'];
          jsonMovie['data_lancamento'] = date.toDate().toString();
          jsonMovie['idTitulo'] = jsonIdTitulo;
          movies.add(MovieModel.fromJson(jsonMovie));
        });
      });
    });

    await Future.delayed(Duration(seconds: 1));
    return movies;
  }

  Future<void> deleteMovie(String id) async{
    await _firestore.collection('filme').doc(id).delete();
  }
}
