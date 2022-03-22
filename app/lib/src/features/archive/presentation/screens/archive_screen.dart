import 'package:app/src/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';

class ArchiveScreen extends BaseScreen {
  ArchiveScreen({Key? key}) : super(key: key);

  @override
  final appBar = AppBar(
    title: const Text("Archive Screen"),
  );
}
