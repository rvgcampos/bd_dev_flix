import 'package:devflix/app/core/theme/app_colors.dart';
import 'package:devflix/app/modules/home/components/category_component.dart';
import 'package:devflix/app/modules/home/components/popular_component.dart';
import 'package:devflix/app/modules/home/home_controller.dart';
import 'package:devflix/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Center(
            child: Obx(()=> Text(
              'Olá, ${controller.user.primeiroNome}!',
              style: TextStyle(color: AppColors.contrast, fontSize: 26),
            )),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BARRA DE PESQUISA
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: AppColors.contrast),
                                  decoration: InputDecoration(
                                    hintText: 'Pesquise o seu filme',
                                    hintStyle: TextStyle(
                                      color: AppColors.grey,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: AppColors.grey,
                                ),
                                onPressed: () {
                                  print('Pressionado');
                                },
                              ),
                            ],
                          ),
                        ),
                        decoration: new BoxDecoration(
                          color: Color(
                            0xFF070D2D,
                          ),
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        width: 320,
                        height: 50,
                        margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                    ],
                  ),
                ),
                // TITULO: CATEGORIAS
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Categorias',
                        style:
                            TextStyle(color: AppColors.contrast, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                // EMOJIS: CATEGORIAS
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryComponent('Horror', 'horror'),
                      CategoryComponent('Romance', 'romance'),
                      CategoryComponent('Comedy', 'comedy'),
                      CategoryComponent('Drama', 'drama'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    'Popular',
                    style: TextStyle(color: AppColors.contrast, fontSize: 18),
                  ),
                ),
                Obx(()=>
                Container(
                  height: 330,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: controller.listMovies.map(
                      (movie) => PopularComponent(
                        movie.tituloModel.titulo,
                        movie.image
                      )).toList()
                  ),
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.contrast.withAlpha(50),
          elevation: 0,
          // currentIndex: movieProvider.selectedIndex,
          selectedItemColor: AppColors.contrast,
          onTap: (index) {
            if (index == 0) {
               Get.toNamed(Pages.HOME);
            }else if (index == 1){
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
      ),
    );
  }
}
