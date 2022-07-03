import '../../config/app_routes.dart';
import 'package:flutter/material.dart';

import '../../config/app_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("An error occurred. Please don't cry."),
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          child: const Text("Go Home (you can cry there)"),
          onPressed: () {
            AppRouter.router.go(AppRoutes.root.path);
          },
        ),
      )),
    );
  }
}
