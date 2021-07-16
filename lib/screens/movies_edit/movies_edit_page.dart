import 'package:devflix/core/theme/app_colors.dart';
import 'package:devflix/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            'Olá, Renato!',
            style: TextStyle(color: AppColors.contrast, fontSize: 26),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/perfil/perfil.jpg'),
              backgroundColor: AppColors.transparent,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.darkBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TITULO: CATEGORIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Editar Filme',
                      style: TextStyle(color: AppColors.contrast, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: AppColors.contrast),
                              decoration: InputDecoration(
                                labelStyle:
                                    TextStyle(color: AppColors.contrast),
                                hintText: 'Nome',
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
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  onPrimary: AppColors.contrast,
                  primary: AppColors.blue[800],
                  minimumSize: Size(320, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(color: AppColors.contrast, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkBlue,
        unselectedItemColor: AppColors.contrast.withAlpha(50),
        elevation: 0,
        // currentIndex: movieProvider.selectedIndex,
        selectedItemColor: AppColors.contrast,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Pages.HOME);
          } else if (index == 1) {
            Get.toNamed(Pages.MOVIES);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
              color: AppColors.contrast,
            ),
            label: 'Geral',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              color: AppColors.contrast,
            ),
            label: 'Filme',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              color: AppColors.contrast,
            ),
            label: 'Séries',
          ),
        ],
      ),
    );
  }
}
