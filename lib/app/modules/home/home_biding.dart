import 'package:devflix/app/data/datasource/movies_datasource.dart';
import 'package:devflix/app/data/repositories/movies_repository.dart';
import 'package:devflix/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesDatasource());
    Get.lazyPut(() => MoviesRepository(Get.find()));
    Get.lazyPut<HomePageController>(() => HomePageController(Get.find()));
  }
}