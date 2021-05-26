import 'package:devflix/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomePageController>(() => HomePageController());
  }
}