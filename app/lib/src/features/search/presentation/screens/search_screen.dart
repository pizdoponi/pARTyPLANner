import 'package:app/src/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends BaseScreen {
  SearchScreen({Key? key}) : super(key: key);

  @override
  final appBar = AppBar(
    title: const Text("Search Screen"),
  );
}
