import 'package:devflix/app/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesEditPageController extends GetxController {
  final yearText = TextEditingController();
  final titleText =  TextEditingController();
  final sinopseText =  TextEditingController();
  final genderText =  TextEditingController();
  var finalDate = 'Sem data'.obs;
  MovieModel? movie;
  var isFormValid = false.obs;
  DateTime? responseDate;

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

  void validateForm(String _){
    final textValidate = yearText.text.isNotEmpty && titleText.text.isNotEmpty && sinopseText.text.isNotEmpty && genderText.text.isNotEmpty;
    isFormValid.value =  textValidate && responseDate != null;
  }
}
