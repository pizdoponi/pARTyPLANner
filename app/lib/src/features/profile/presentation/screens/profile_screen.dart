import 'package:app/src/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends BaseScreen {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  final appBar = AppBar(
    title: const Text("Profile Screen"),
  );
}
