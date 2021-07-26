import 'package:devflix/app/modules/users/users_controller.dart';
import 'package:get/get.dart';

class UsersPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
