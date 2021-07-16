import 'package:devflix/screens/movies/movies_controller.dart';
import 'package:get/get.dart';

class MoviesPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesPageController>(() => MoviesPageController());
  }
}
