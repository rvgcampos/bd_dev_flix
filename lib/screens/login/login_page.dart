import 'package:devflix/core/theme/app_colors.dart';
import 'package:devflix/global_components/button_app.dart';
import 'package:devflix/global_components/textfield_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.darkBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png'),
            const SizedBox(height: 10),
            Obx(() => TextFieldApp(
              hintText: 'E-mail',
              textEditingController:controller.usernameController,
              validatedField: controller.validatedUsername.value,
            )),
            Obx(() => TextFieldApp(
              hintText: 'Senha',
              password: true,
              enableObscure: controller.enableObscure.value,
              tapObscure: ()=> controller.changeObscure(),
              textEditingController:controller.passwordController,
              validatedField: controller.validatedPassword.value,
            )),
            const SizedBox(height: 10),
            Obx(() => ButtonApp(
              title: 'Entrar',
              loading: controller.loading.value,
              onPressed: () => controller.signIn(),
            )),
          ],
        ),
      ),
    );
  }
}
