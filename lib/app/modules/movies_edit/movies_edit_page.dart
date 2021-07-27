import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'components/input_component.dart';
import 'movies_edit_controller.dart';

class MoviesEditPage extends GetView<MoviesEditPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Text(
            controller.movie !=null ? 'Editar Filme' : 'Criar Filme',
            style: TextStyle(color: AppColors.contrast, fontSize: 18),
          ),
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.titleText,
                        hintText: 'Titulo',
                        inputName: 'Titulo',
                      ),
                      TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 1, 1),
                                maxTime: DateTime(2021, 6, 28),
                                theme: DatePickerTheme(
                                    headerColor: AppColors.blue[800],
                                    backgroundColor: AppColors.darkBlue,
                                    itemStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    doneStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16)), onConfirm: (date) {
                              controller.setDate(date);
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Text(
                            'Selecione a data de lançamento',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                          )),
                      Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Center(
                            child: Obx(() => Text(controller.finalDate.value,
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                          )),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.yearText,
                        hintText: 'Ano',
                        inputName: 'Ano',
                      ),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.genderText,
                        hintText: 'Genero',
                        inputName: 'genero',
                      ),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.sinopseText,
                        hintText: 'Sinopse',
                        inputName: 'sinopse',
                        textArea: true,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => ElevatedButton(
                      onPressed: controller.isFormValid.value ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        onPrimary: AppColors.contrast,
                        primary: AppColors.blue[800],
                        onSurface: AppColors.contrast,
                        minimumSize: Size(320, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        'Salvar',
                        style:
                            TextStyle(color: AppColors.contrast, fontSize: 16),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
