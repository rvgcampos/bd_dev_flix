import 'package:devflix/app/data/models/genero_model.dart';
import 'package:devflix/app/data/models/serie_model.dart';
import 'package:devflix/app/data/models/titulo_model.dart';
import 'package:devflix/app/data/repositories/serie_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesEditPageController extends GetxController {
  final yearText = TextEditingController();
  final yearEndText = TextEditingController();
  final titleText =  TextEditingController();
  final sinopseText =  TextEditingController();
  final genderText =  TextEditingController();
  var loading = false.obs;
  var isFormValid = false.obs;
  SeriesRepository seriesRepository;
  SeriesModel? series;
  SeriesEditPageController(this.seriesRepository);

 @override
  Future<void> onInit() async {
    super.onInit();
    final arguments = Get.arguments;
    if(arguments != null){
      series = Get.arguments;
      initialize();
    }
  }

  initialize(){
    yearText.text = series!.tituloModel!.ano.toString();
    yearEndText.text = series!.anoFim.toString();
    titleText.text = series!.tituloModel!.titulo!;
    sinopseText.text = series!.tituloModel!.sinopse!;
    genderText.text = series!.tituloModel!.generoModel!.genero;
  }

  Future<void> addSerie() async{
    try {
      loading.value = true;
      await seriesRepository.addSerie(
        SeriesModel(
          anoFim: int.parse(yearEndText.text),
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

  Future<void> editSerie() async{
    try {
      loading.value = true;
      await seriesRepository.editSerie(
        SeriesModel(
          id: series!.id,
          anoFim: int.parse(yearEndText.text),
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
    final textValidate = yearEndText.text.isNotEmpty && yearText.text.isNotEmpty && titleText.text.isNotEmpty && sinopseText.text.isNotEmpty && genderText.text.isNotEmpty;
    isFormValid.value =  textValidate;
  }
}
