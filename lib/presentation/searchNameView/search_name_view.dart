import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/presentation/home_view/home.dart';

import '../../configs/routes/routes_name.dart';

class SearchNameView extends StatefulWidget {
  const SearchNameView({super.key});

  @override
  State<SearchNameView> createState() => _SearchNameViewState();
}

class _SearchNameViewState extends State<SearchNameView> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(title: Text("Search Github User")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),

        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Github User for search github user ",
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value?.isEmpty ?? false || value == null) {
                    return "Please enter github user name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Github user name",
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(
                        RoutesName.home,
                        arguments: {'userName': _controller.text.trim()},
                      );
                    }
                  },
                  child: const Text("Search"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
