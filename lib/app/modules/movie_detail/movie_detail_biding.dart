import 'package:devflix/app/modules/movie_detail/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetailPageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MovieDetailPageController>(() => MovieDetailPageController());
  }
}