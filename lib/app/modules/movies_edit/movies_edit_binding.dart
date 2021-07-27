import 'package:devflix/app/data/datasource/movies_datasource.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:devflix/app/modules/movies_edit/movies_edit_controller.dart';
import 'package:get/get.dart';

class MoviesEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesDatasource());
    Get.lazyPut(() => MoviesRepository(Get.find()));
    Get.lazyPut<MoviesEditPageController>(() => MoviesEditPageController(Get.find()));
  }
}
