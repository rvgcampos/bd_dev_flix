import 'package:devflix/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {

  final FirebaseAuth _firebaseAuth;
  LoginPageController(this._firebaseAuth);
  var loading = false.obs;
  var enableObscure = true.obs;
  var validatedUsername = true.obs;
  var validatedPassword = true.obs;
  var usernameController =  TextEditingController();
  var passwordController = TextEditingController();

  void changeObscure() => enableObscure.value = !enableObscure.value;

  bool validateFields(){
    validatedUsername.value = usernameController.text.isEmpty ? true : false;
    validatedPassword.value = passwordController.text.isEmpty ? true : false;
    return validatedPassword.value && validatedUsername.value;
  }

  Future<void> signIn() async{
    loading.value = true;
    if(validateFields())
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
        email: usernameController.text, password: passwordController.text
      );
      await Get.offNamed(Pages.HOME);
    } on FirebaseAuthException catch(e){
      validatedUsername.value = false;
      validatedPassword.value = false;
      print(e.toString());
    }
    loading.value = false;
  }
}