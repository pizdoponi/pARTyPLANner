import 'package:app/src/core/widgets/base_screen.dart';
import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("HomeScreen"),
//       ),
//       bottomNavigationBar: const Navbar(),
//     );
//   }
// }

class HomeScreen extends BaseScreen {
  HomeScreen({Key? key}) : super(key: key);

  @override
  final child = ListView.builder(
    itemCount: 20,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text("Item $index lalalalalala"),
        onTap: () {
          print("tapped");
        },
        leading: const Icon(Icons.blur_linear_outlined),
        trailing: const Icon(Icons.umbrella),
        style: ListTileStyle.list,
      );
    },
    padding: const EdgeInsets.symmetric(horizontal: 10),
  );
}
