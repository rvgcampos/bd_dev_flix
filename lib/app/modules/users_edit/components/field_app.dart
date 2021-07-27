import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String hintText;
  final bool validatedField;
  final bool password;
  final bool enableObscure;
  final Function()? tapObscure;
  final TextEditingController textEditingController;

  TextFieldApp({
    required this.hintText,
    required this.textEditingController,
    this.tapObscure,
    this.validatedField = true,
    this.enableObscure = false,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            border: Border.all(
                color: validatedField ? AppColors.grey : AppColors.red),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: textEditingController,
                  style: TextStyle(color: AppColors.contrast),
                  obscureText: enableObscure,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: AppColors.contrast),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                )),
                if (password)
                  InkWell(
                    onTap: tapObscure,
                    child: Icon(!enableObscure ? Icons.lock_open : Icons.lock,
                        color: AppColors.contrast),
                  ),
              ],
            ),
          ),
        ),
        Container(
            width: 300,
            child: Text(
              validatedField ? '' : 'Validar campo',
              style: TextStyle(color: AppColors.red),
            ))
      ],
    );
  }
}
