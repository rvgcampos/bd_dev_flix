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

    await Future.delayed(Duration(seconds: 2));
    return movies;
  }

  Future<void> deleteMovie(String id) async{
    await _firestore.collection('filme').doc(id).delete();
  }

  Future<void> adicionarFilme(MovieModel movie) async {
    final generoRef = await _firestore.collection('genero').add({
      'genero': movie.tituloModel!.generoModel!.genero
    });
    final tituloRef = await _firestore.collection('titulo').add({
      'ano':movie.tituloModel!.ano,
      'idGenero':generoRef.path.substring(7),
      'sinopse':movie.tituloModel!.sinopse,
      'titulo':movie.tituloModel!.titulo
    });
    await _firestore.collection('filme').add({
      'data_lancamento': movie.dataLancamento,
      'idTitulo':tituloRef,
      'idVideo':'',
      'image':'https://firebasestorage.googleapis.com/v0/b/dev-flix-bd.appspot.com/o/download.jpeg?alt=media&token=93f67d56-5dad-4312-bb4a-fa773b124ed4'
    });
  }

  Future<void> editMovie(MovieModel movie) async {
    final movieRepo = await _firestore.collection('filme').doc(movie.id).get();
    final movieData = movieRepo.data() as Map<String, dynamic>;
    DocumentReference tituloRef = await movieRepo.get('idTitulo');
    DocumentSnapshot tituloRepo = await tituloRef.get();
    final idGenero = tituloRepo.data() as Map<String, dynamic>;
    await tituloRef.update({
      'ano':movie.tituloModel!.ano,
      'sinopse':movie.tituloModel!.sinopse,
      'titulo':movie.tituloModel!.titulo,
      'idGenero':idGenero['idGenero']
    });
    await _firestore.collection('genero').doc(idGenero['idGenero']).update({
      'genero': movie.tituloModel!.generoModel!.genero
    });
    await _firestore.collection('filme').doc(movie.id).update({
      'data_lancamento': movie.dataLancamento,
      'image': movieData['image'],
      'idVideo': movieData['idVideo'],
      'idTitulo': movieData['idTitulo']
    });
  }
}
