import 'package:get/get.dart';
import 'package:github_explorer/configs/routes/routes_name.dart';
import 'package:github_explorer/models/repo_model.dart';
import 'package:github_explorer/presentation/RepoDetailsView/repo_details_view.dart';
import 'package:github_explorer/presentation/home_view/home.dart';
import 'package:github_explorer/presentation/searchNameView/search_name_view.dart';

class RouteManager {
  static final routes=[
    GetPage(name: RoutesName.searchNameView, page: () => SearchNameView(),),
    GetPage(
      name: RoutesName.home,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final userName = args?['userName'] ?? '';
        return HomeView( username: userName,);
      },
    ),   GetPage(
      name: RoutesName.repoDetails,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final RepoModel repo = args?['repo'];
        return RepoDetailsView(repo: repo);
      },
    ),

  ];

}