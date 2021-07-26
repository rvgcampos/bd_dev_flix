import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devflix/app/data/models/movie_model.dart';
import 'package:devflix/app/data/models/user_model.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  LoginPageController(this._firebaseAuth, this._firestore);
  var loading = false.obs;
  var enableObscure = true.obs;
  var validatedUsername = true.obs;
  var validatedPassword = true.obs;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void changeObscure() => enableObscure.value = !enableObscure.value;

  bool validateFields() {
    validatedUsername.value = usernameController.text.isEmpty ? false : true;
    validatedPassword.value = passwordController.text.isEmpty ? false : true;
    return validatedPassword.value && validatedUsername.value;
  }

  Future<void> signIn() async {
    if (validateFields()) {
      loading.value = true;
      try {
        var user = UserModel(
          email: '',
          primeiroNome: '',
          sobrenome: '',
        );
        await _firebaseAuth.signInWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);

        await _firestore.collection('conta').get().then((value) {
          value.docs.forEach((doc) {
            if (doc.get('email') == usernameController.text) {
              user = UserModel.fromJson(doc.data());
            }
          });
        }).whenComplete(() {
          Get.offNamed(Pages.HOME, arguments: user);
          loading.value = false;
        });
      } on FirebaseAuthException catch (e) {
        validatedUsername.value = false;
        validatedPassword.value = false;
        loading.value = false;
        debugPrint(e.toString());
      }
    }
  }
}
