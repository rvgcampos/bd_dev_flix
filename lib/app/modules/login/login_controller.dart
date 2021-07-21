import 'package:cloud_firestore/cloud_firestore.dart';
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
      var user;
      await _firebaseAuth.signInWithEmailAndPassword(
        email: usernameController.text, password: passwordController.text
      );
      await _firestore.collection('conta').snapshots().forEach((documents) {
        documents.docs.forEach((doc) { 
          if(doc['email'] == usernameController.text){
            user = UserModel.fromDocument(doc);
          }else{
            user = UserModel(
              email: '', 
              primeiroNome: '', 
              sobrenome: '',
            );
          }
        });
      });
      await Get.offNamed(Pages.HOME, arguments:user);
    } on FirebaseAuthException catch(e){
      validatedUsername.value = false;
      validatedPassword.value = false;
      print(e.toString());
    }
    loading.value = false;
  }
}