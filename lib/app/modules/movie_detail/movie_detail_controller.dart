import 'package:devflix/app/data/models/titulo_model.dart';
import 'package:get/get.dart';

class MovieDetailPageController extends GetxController {
  var tituloModel = TituloModel().obs;
  var imageUrl = ''.obs;

  @override
  void onInit() {
    tituloModel.value = Get.arguments[0];
    imageUrl.value = Get.arguments[1];
    super.onInit();
  }

}