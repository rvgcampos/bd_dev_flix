import 'package:devflix/app/data/models/genero_model.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/models/titulo_model.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesEditPageController extends GetxController {
  final yearText = TextEditingController();
  final titleText =  TextEditingController();
  final sinopseText =  TextEditingController();
  final genderText =  TextEditingController();
  var loading = false.obs;
  var finalDate = 'Sem data'.obs;
  var isFormValid = false.obs;
  MoviesRepository moviesRepository;
  MovieModel? movie;
  DateTime? responseDate;
  MoviesEditPageController(this.moviesRepository);

 @override
  Future<void> onInit() async {
    super.onInit();
    final arguments = Get.arguments;
    if(arguments != null){
      movie = Get.arguments;
      initialize();
    }
  }

  initialize(){
    yearText.text = movie!.tituloModel!.ano.toString();
    titleText.text = movie!.tituloModel!.titulo!;
    sinopseText.text = movie!.tituloModel!.sinopse!;
    genderText.text = movie!.tituloModel!.generoModel!.genero;
    finalDate.value = movie!.dataLancamento!.toString().substring(0,11);
    responseDate = movie!.dataLancamento;
  }

  setDate(DateTime date){
    finalDate.value = date.toString().substring(0,11);
    responseDate = date;
    validateForm('');
  }

  Future<void> addMovie() async{
    try {
      loading.value = true;
      await moviesRepository.addMovie(
        MovieModel(
          dataLancamento: responseDate,
          tituloModel: TituloModel(
            sinopse: sinopseText.text,
            titulo: titleText.text,
            ano: int.parse(yearText.text),
            generoModel: GeneroModel(
              genero: genderText.text
            )
          )
        )
      );
      Get.back();
      loading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loading.value = false;
    }
  }

  Future<void> editMovie() async{
    try {
      loading.value = true;
      await moviesRepository.editMovie(
        MovieModel(
          id: movie!.id,
          dataLancamento: responseDate,
          tituloModel: TituloModel(
            sinopse: sinopseText.text,
            titulo: titleText.text,
            ano: int.parse(yearText.text),
            generoModel: GeneroModel(
              genero: genderText.text
            )
          )
        )
      );
      Get.back();
      loading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loading.value = false;
    }
  }

  void validateForm(String _){
    final textValidate = yearText.text.isNotEmpty && titleText.text.isNotEmpty && sinopseText.text.isNotEmpty && genderText.text.isNotEmpty;
    isFormValid.value =  textValidate && responseDate != null;
  }
}
