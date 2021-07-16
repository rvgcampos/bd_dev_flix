import 'package:devflix/screens/movies/movies_controller.dart';
import 'package:devflix/screens/movies_edit/movies_edit_controller.dart';
import 'package:get/get.dart';

class MoviesEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesEditPageController>(() => MoviesEditPageController());
  }
}
