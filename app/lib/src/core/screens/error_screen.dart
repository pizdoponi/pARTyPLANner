import 'package:app/src/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Screen"),
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          child: const Text("Go Home"),
          onPressed: () {
            AppRouter.router.go(AppRoutes.root.path);
          },
        ),
      )),
    );
  }
}
