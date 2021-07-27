import 'package:devflix/app/data/models/serie_model.dart';
import 'package:devflix/app/data/repositories/serie_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesControllerController extends GetxController {

  SeriesRepository seriesRepository;
  var loading = false.obs;
  final listSeries = <SeriesModel>[].obs;

  SeriesControllerController(this.seriesRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    loadSeries();
  }

  Future<void> deleteSerie(String id) async{
    try {
      await seriesRepository.deleteSerie(id);
      await loadSeries();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future loadSeries() async {
    loading.value = true;
    listSeries.clear();
    try {
      final response = await seriesRepository.getSeries();
      listSeries.addAll(response);
    } catch (e) {
      debugPrint(e.toString());
    }
    loading.value = false;
  }
}