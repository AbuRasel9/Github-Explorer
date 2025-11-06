import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/controller/github_controller.dart';
class HomeView extends StatefulWidget {
  final String userName;
  const HomeView({super.key, required this.userName});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller=Get.put(GithubController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
