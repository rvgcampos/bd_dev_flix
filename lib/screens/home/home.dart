import 'package:devflix/screens/home/components/category_component.dart';
import 'package:devflix/screens/home/components/popular_component.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070D2D),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Olá, Renato!',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: Color(0xFF070D2D),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/perfil/perfil.jpg'),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
      body: Container(
        color: Color(0xFF070D2D),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Pesquise o seu filme',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
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
                      border: Border.all(color: Colors.grey),
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
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              height: 330,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PopularComponent('La Casa de Papel', 'casa_papel'),
                  PopularComponent('Velozes e Furiosos 9', 'velozes_furiosos'),
                  PopularComponent('John Wick 3', 'john_wick'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF070D2D),
        unselectedItemColor: Color(0xFF536FE5).withAlpha(50),
        elevation: 0,
        // currentIndex: movieProvider.selectedIndex,
        selectedItemColor: Color(0xFF536FE5),
        onTap: (index) {
          print('sdas');
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
              color: Color(0xFF536FE5),
            ),
            label: 'Geral',
            // title: Text('Geral'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              color: Color(0xFF536FE5),
            ),
            label: 'Geral',
            // title: Text('Meus Filmes'),
          ),
        ],
      ),
    );
  }
}
