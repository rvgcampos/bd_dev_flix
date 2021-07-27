import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/serie_model.dart';

class SeriesDatasource {
  final _firestore = FirebaseFirestore.instance;

  Future<List<SeriesModel>> searchSeries() async {
    var movies = [].cast<SeriesModel>();
    await _firestore.collection('serie').get().then((value) {
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
          jsonMovie['ano_fim'] = doc['ano_fim'];
          jsonMovie['idTitulo'] = jsonIdTitulo;
          movies.add(SeriesModel.fromJson(jsonMovie));
        });
      });
    });

    await Future.delayed(Duration(seconds: 1));
    return movies;
  }
  Future<void> deleteSerie(String id) async{
    await _firestore.collection('serie').doc(id).delete();
  }
  Future<void> adicionarSerie(SeriesModel serie) async {
    final generoRef = await _firestore.collection('genero').add({
      'genero': serie.tituloModel!.generoModel!.genero
    });
    print("HUSHUASHASHUASUHHUASH GENEROOOOOOOO");
    final tituloRef = await _firestore.collection('titulo').add({
      'ano':serie.tituloModel!.ano,
      'idGenero':generoRef.path.substring(7),
      'sinopse':serie.tituloModel!.sinopse,
      'titulo':serie.tituloModel!.titulo
    });
    print("HUSHUASHASHUASUHHUASH tituloooooooo");
    await _firestore.collection('serie').add({
      'ano_fim': serie.anoFim,
      'idTitulo':tituloRef,
      'image':'https://firebasestorage.googleapis.com/v0/b/dev-flix-bd.appspot.com/o/download.jpeg?alt=media&token=93f67d56-5dad-4312-bb4a-fa773b124ed4'
    });
  }
  Future<void> editSerie(SeriesModel serie) async {
    final serieRepo = await _firestore.collection('serie').doc(serie.id).get();
    final seriData = serieRepo.data() as Map<String, dynamic>;
    DocumentReference tituloRef = await serieRepo.get('idTitulo');
    DocumentSnapshot tituloRepo = await tituloRef.get();
    final idGenero = tituloRepo.data() as Map<String, dynamic>;
    await tituloRef.update({
      'ano':serie.tituloModel!.ano,
      'sinopse':serie.tituloModel!.sinopse,
      'titulo':serie.tituloModel!.titulo,
      'idGenero':idGenero['idGenero']
    });
    await _firestore.collection('genero').doc(idGenero['idGenero']).update({
      'genero': serie.tituloModel!.generoModel!.genero
    });
    await _firestore.collection('serie').doc(serie.id).update({
      'ano_fim': serie.anoFim,
      'image': seriData['image'],
      'idTitulo': seriData['idTitulo']
    });
  }
}
