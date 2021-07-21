import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginPageController>(() => 
  LoginPageController(FirebaseAuth.instance, FirebaseFirestore.instance));
  }
}