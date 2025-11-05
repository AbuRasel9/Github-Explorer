import 'package:get/get.dart';
import 'package:github_explorer/configs/routes/routes_name.dart';
import 'package:github_explorer/presentation/RepoDetailsView/repo_details_view.dart';
import 'package:github_explorer/presentation/home_view/home.dart';
import 'package:github_explorer/presentation/searchNameView/search_name_view.dart';

class RouteManager {
  static final routes=[
    GetPage(name: RoutesName.searchNameView, page: () => SearchNameView(),),
    GetPage(name: RoutesName.home, page: () => HomeView(),),
    GetPage(name: RoutesName.repoDetails, page: () => RepoDetailsView(),),
  ];

}