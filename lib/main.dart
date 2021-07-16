import 'package:devflix/core/theme/app_colors.dart';
import 'package:devflix/routes/pages.dart';
import 'package:devflix/screens/movies_edit/movies_edit_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialRoute: Pages.LOGIN,
    // home: MovieEditPage(),
    getPages: Pages.routes,
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: AppColors.blue,
    ),
  ));
}