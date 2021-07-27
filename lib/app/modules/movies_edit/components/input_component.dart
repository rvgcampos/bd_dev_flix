import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {

  final String inputName;
  final bool textArea;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController textEditingController;
  const InputComponent({
    required this.textEditingController,
    required this.inputName,
    this.onChanged,
    this.textArea = false, 
    required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          inputName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Container(
          width: 320,
          height:textArea? null : 50,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            border: Border.all(color: AppColors.grey),
            borderRadius: textArea ? null : BorderRadius.only(
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
                    onChanged: onChanged,
                    controller: textEditingController,
                    maxLines: textArea? 10 : 1,
                    style: TextStyle(color: AppColors.contrast),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.contrast),
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
