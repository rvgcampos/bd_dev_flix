import 'package:devflix/app/modules/home/home_biding.dart';
import 'package:devflix/app/modules/home/home_page.dart';
import 'package:devflix/app/modules/login/login_binding.dart';
import 'package:devflix/app/modules/login/login_page.dart';
import 'package:devflix/app/modules/movie_detail/movie_detail_biding.dart';
import 'package:devflix/app/modules/movie_detail/movie_detail_page.dart';
import 'package:devflix/app/modules/movies/movies_biding.dart';
import 'package:devflix/app/modules/movies/movies_page.dart';
import 'package:devflix/app/modules/movies_edit/movies_edit_binding.dart';
import 'package:devflix/app/modules/movies_edit/movies_edit_page.dart';
import 'package:devflix/app/modules/series_edit/series_edit_binding.dart';
import 'package:devflix/app/modules/series_edit/series_edit_page.dart';
import 'package:devflix/app/modules/users/users_biding.dart';
import 'package:devflix/app/modules/users/users_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

class Pages {

  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const MOVIEDETAIL = Routes.MOVIEDETAIL;
  static const MOVIES = Routes.MOVIES;
  static const MOVIESEDIT = Routes.MOVIESEDIT;
  static const SERIESEDIT = Routes.SERIESEDIT;
  static const USERS = Routes.USERS;

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
    GetPage(
        name: USERS,
        page: () => UsersPage(),
        binding: UsersPageBinding()
        ),
    GetPage(
        name: SERIESEDIT,
        page: () => SeriesEditPage(),
        binding: SeriesEditPageBinding()
        ),
  ];
}
