import 'package:devflix/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {

  final Function()? onPressed;
  final bool loading;
  final String title;

  const ButtonApp({this.onPressed, required this.loading, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: AppColors.contrast,
        primary: AppColors.blue[800],
        minimumSize: Size(320, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: loading ?
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.contrast),
        )
        :
        Text(
          title,
          style: TextStyle(color: AppColors.contrast, fontSize: 16),
        )
    );
  }
}
