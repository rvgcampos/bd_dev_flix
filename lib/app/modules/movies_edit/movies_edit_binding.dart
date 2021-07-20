import 'package:devflix/app/modules/movies_edit/movies_edit_controller.dart';
import 'package:get/get.dart';

class MoviesEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesEditPageController>(() => MoviesEditPageController());
  }
}