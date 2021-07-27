import 'package:devflix/app/data/datasource/series_datasource.dart';
import 'package:devflix/app/data/repositories/serie_repository.dart';
import 'package:devflix/app/modules/series_edit/series_edit_controller.dart';
import 'package:get/get.dart';

class SeriesEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeriesDatasource());
    Get.lazyPut(() => SeriesRepository(Get.find()));
    Get.lazyPut<SeriesEditPageController>(() => SeriesEditPageController(Get.find()));
  }
}
