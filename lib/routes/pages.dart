import 'package:devflix/screens/home/home_biding.dart';
import 'package:devflix/screens/home/home_page.dart';
import 'package:devflix/screens/login/login_binding.dart';
import 'package:devflix/screens/login/login_page.dart';
import 'package:devflix/screens/movie_detail/movie_detail_biding.dart';
import 'package:devflix/screens/movie_detail/movie_detail_page.dart';
import 'package:devflix/screens/movies/movies_biding.dart';
import 'package:devflix/screens/movies/movies_page.dart';
import 'package:devflix/screens/movies_edit/movies_edit_binding.dart';
import 'package:devflix/screens/movies_edit/movies_edit_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

class Pages {

  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const MOVIEDETAIL = Routes.MOVIEDETAIL;
  static const MOVIES = Routes.MOVIES;
  static const MOVIESEDIT = Routes.MOVIESEDIT;

  static final routes = [
    GetPage(
      name: LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBinding()
    ),
    GetPage(
      name: HOME,
      page: () => HomePage(),
      binding: HomePageBinding()
    ),
    GetPage(
      name: MOVIEDETAIL,
      page: () => MovieDetailPage(),
      binding: MovieDetailPageBinding()
    ),
    GetPage(
        name: MOVIES,
        page: () => MoviesPage(),
        binding: MoviesPageBinding()
    ),
    GetPage(
        name: MOVIESEDIT,
        page: () => MoviesEditPage(),
        binding: MoviesEditPageBinding()
        ),
  ];
}
