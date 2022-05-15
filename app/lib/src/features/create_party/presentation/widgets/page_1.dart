import 'package:flutter/material.dart';

import '../../../../config/app_lang.dart';
import 'nullable_tile.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  static final themes = [
    AppLang.lang.birthdayParty,
    AppLang.lang.picnic,
    AppLang.lang.cocktailParty,
    AppLang.lang.discoParty,
    AppLang.lang.getTogether,
    AppLang.lang.sportEvent,
    AppLang.lang.massParty,
    AppLang.lang.customParty
  ];

  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Center(
              child: Text(AppLang.lang.selectPartyThemeMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: _screenWidth - 4 * ((_screenWidth * 0.15 / 3) * 1.1),
              child: ListView.builder(
                  itemCount: Page1.themes.length,
                  itemBuilder: (context, index) =>
                      NullableTile(theme: Page1.themes[index])),
            ),
          )
        ],
      ),
    );
  }
}
