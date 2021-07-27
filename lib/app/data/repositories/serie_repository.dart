import 'package:devflix/app/data/datasource/series_datasource.dart';
import 'package:devflix/app/data/models/serie_model.dart';
import 'package:flutter/material.dart';

class SeriesRepository{

  SeriesDatasource _datasource;
  SeriesRepository(this._datasource);

  Future<List<SeriesModel>> getSeries() async {
    List<SeriesModel> list;
    try {
      list = await _datasource.searchSeries();
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteSerie(String id) async {
    try {
      await _datasource.deleteSerie(id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addSerie(SeriesModel movie) async {
    try {
      await _datasource.adicionarSerie(movie);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editSerie(SeriesModel movie) async {
    try {
      await _datasource.editSerie(movie);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
