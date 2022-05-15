import 'package:flutter/material.dart';

import '../../../../config/app_router.dart';
import '../../../home/presentation/widgets/background.dart';
import '../widgets/navigation_button.dart';
import '../widgets/page_1.dart';
import '../widgets/page_2.dart';
import '../widgets/page_3.dart';
import '../widgets/page_4.dart';
import '../widgets/page_5.dart';

class CreatePartyScreen extends StatefulWidget {
  CreatePartyScreen({Key? key, required this.pageIndex}) : super(key: key);

  int pageIndex;

  late var theme;
  late var title;
  late var location;
  late var dateTime;
  late var isPrivate;

  @override
  _CreatePartyScreenState createState() {
    return _CreatePartyScreenState();
  }
}

class _CreatePartyScreenState extends State<CreatePartyScreen> {
  static var sizeMagnifier = 1.0;
  static var gapMagnifier = 1.0;
  static final _pages = [Page1(), Page2(), Page3(), Page4(), Page5()];

  @override
  Widget build(BuildContext context) {
    double _size = (MediaQuery.of(context).size.width * 0.15 / 3) *
        sizeMagnifier; //velikost je tko da je to polovica prostora med listview in robom
    double _gap = (_size / 2) * gapMagnifier;
    var _page = _pages[widget.pageIndex - 1];
    var _range = _size + _gap;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                AppRouter.router.pop();
              },
            ),
            title: const Text("Let's create a new party:) YAY!"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.info))
            ]),
        body: Stack(
          children: <Widget>[
            const backgroundGradientPage(),
            Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(300),
                      topRight: Radius.circular(300)),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 40, 89, 182)
                          .withOpacity(0.5),
                      spreadRadius: 70,
                      blurRadius: 100,
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(255, 11, 29, 195)
                          .withOpacity(0.3),
                      spreadRadius: -4,
                      blurRadius: 100,
                    )
                  ]),
              height: 200,
              width: 100,
            ),
            Container(
              width: 250,
              height: 250,
              margin: const EdgeInsets.only(top: 380, left: 129),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(199, 114, 55, 153).withOpacity(0.3),
                  spreadRadius: 70,
                  blurRadius: 1000,
                ),
                BoxShadow(
                  color:
                      const Color.fromARGB(201, 125, 26, 190).withOpacity(0.2),
                  spreadRadius: -1,
                  blurRadius: 100,
                )
              ]),
            ),
            _page,
            Positioned(
              right: _size / 2,
              top: MediaQuery.of(context).size.height / 2 -
                  (5 * (_size + _gap) / 2),
              // MediaQuery.of(context).size.height / 2.25 -
              // (5 * (_size + _gap) / 2) -
              // AppBar().preferredSize.height,
              child: GestureDetector(
                onLongPressStart: (LongPressStartDetails details) {
                  setState(() {
                    sizeMagnifier = 1.1;
                    gapMagnifier = 1.5;
                  });
                },
                onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                  var _y = details.localPosition.dy;
                  if (_y < _range) {
                    widget.pageIndex = 1;
                    setState(() {});
                  } else if (_y >= _range && _y < 2 * _range) {
                    widget.pageIndex = 2;
                    // child.children[pageIndex].setState();
                    setState(() {});
                  } else if (_y >= 2 * _range && _y < 3 * _range) {
                    widget.pageIndex = 3;
                    setState(() {});
                  } else if (_y >= 3 * _range && _y < 4 * _range) {
                    widget.pageIndex = 4;
                    setState(() {});
                  } else if (_y >= 4 * _range) {
                    widget.pageIndex = 5;
                    setState(() {});
                  } //else v bistvu ne obstaja
                },
                onLongPressEnd: (LongPressEndDetails details) {
                  setState(() {
                    sizeMagnifier = 1.0;
                    gapMagnifier = 1.0;
                  });
                },
                onTapUp: (TapUpDetails details) {
                  var _y = details.localPosition.dy;
                  if (_y < _range) {
                    widget.pageIndex = 1;
                    setState(() {});
                  } else if (_y >= _range && _y < 2 * _range) {
                    widget.pageIndex = 2;
                    setState(() {});
                  } else if (_y >= 2 * _range && _y < 3 * _range) {
                    widget.pageIndex = 3;
                    setState(() {});
                  } else if (_y >= 3 * _range && _y < 4 * _range) {
                    widget.pageIndex = 4;
                    setState(() {});
                  } else if (_y >= 4 * _range) {
                    widget.pageIndex = 5;
                    setState(() {});
                  } //else v bistvu ne obstaja},
                },
                child: Column(
                  //da se velikost spreminja med držanjem bo mogoče treba narest vsak button posebi stateful
                  children: [
                    NavigationButton(
                        index: 1,
                        pageIndex: widget.pageIndex,
                        size: _size,
                        gap: _gap),
                    NavigationButton(
                        index: 2,
                        pageIndex: widget.pageIndex,
                        size: _size,
                        gap: _gap),
                    NavigationButton(
                        index: 3,
                        pageIndex: widget.pageIndex,
                        size: _size,
                        gap: _gap),
                    NavigationButton(
                        index: 4,
                        pageIndex: widget.pageIndex,
                        size: _size,
                        gap: _gap),
                    NavigationButton(
                        index: 5,
                        pageIndex: widget.pageIndex,
                        size: _size,
                        gap: _gap)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
