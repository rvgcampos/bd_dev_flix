import 'package:devflix/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {

  final FirebaseAuth _firebaseAuth;
  LoginPageController(this._firebaseAuth);
  var loading = RxBool(false);
  var enableObscure = RxBool(true);
  var validatedUsername = RxBool(true);
  var validatedPassword = RxBool(true);
  var usernameController =  TextEditingController();
  var passwordController = TextEditingController();

  void changeObscure() => enableObscure.value = !enableObscure.value;

  bool validateFields(){
    if(usernameController.text.isEmpty){
      validatedUsername.value = false;
    }else{
      validatedUsername.value = true;
    }
    if(passwordController.text.isEmpty){
      validatedPassword.value = false;
    }else{
      validatedPassword.value = true;
    }
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