import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/input_component.dart';
import 'series_edit_controller.dart';

class SeriesEditPage extends GetView<SeriesEditPageController> {
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
            controller.series !=null ? 'Editar Serie' : 'Criar Serie',
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
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.yearEndText,
                        number: true,
                        hintText: 'Ano Término',
                        inputName: 'Ano Término',
                      ),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.yearText,
                        number: true,
                        hintText: 'Ano',
                        inputName: 'Ano',
                      ),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.genderText,
                        hintText: 'Gênero',
                        inputName: 'Gênero',
                      ),
                      InputComponent(
                        onChanged: controller.validateForm,
                        textEditingController: controller.sinopseText,
                        hintText: 'Sinopse',
                        inputName: 'Sinopse',
                        textArea: true,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => Padding(
                  padding: const EdgeInsets.only(left:10, right: 10),
                  child: ElevatedButton(
                        onPressed: controller.isFormValid.value ? 
                          controller.series == null ? controller.addSerie : controller.editSerie 
                          : null,
                        style: ElevatedButton.styleFrom(
                          onPrimary: AppColors.contrast,
                          primary: AppColors.blue[800],
                          onSurface: AppColors.contrast,
                          minimumSize: Size(320, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: controller.loading.value ?
                        Center(child: CircularProgressIndicator(),) :
                        Text(
                          'Salvar',
                          style:
                              TextStyle(color: AppColors.contrast, fontSize: 16),
                        ),
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
