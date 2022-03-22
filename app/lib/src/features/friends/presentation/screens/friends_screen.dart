import 'package:app/src/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends BaseScreen {
  FriendsScreen({Key? key}) : super(key: key);

  @override
  final appBar = AppBar(
    title: Text("Friends Screen"),
  );
}
