import '../../../../../config/app_lang.dart';
import 'neon_sign_status.dart';
import 'package:flutter/cupertino.dart';

import 'neon_border_animation.dart';
import 'neon_border_painter.dart';
import 'neon_text.dart';
import 'neon_text_animation.dart';

class NeonSign extends StatelessWidget {
  const NeonSign({Key? key, required this.text}) : super(key: key);

  final String text;

  // static const double rectHeightInner = 35.0;
  // static const double rectHeightOuter = 45.0;
  // static const double rectWidthInner = 230.0;
  // static const double rectWidthOuter = 240.0;

  @override
  Widget build(BuildContext context) {
    var rectHeightInner = 35.0;
    var rectHeightOuter = 45.0;
    var rectWidthInner = 230.0;
    var rectWidthOuter = 240.0;
    var attendingHasLoaded = NeonSignStatus.attendingHasLoaded;
    var trendingHasLoaded = NeonSignStatus.trendingHasLoaded;
    late bool _shouldAnimate;
    if (text == AppLang.lang.attending) {
      _shouldAnimate = !attendingHasLoaded;
      if (_shouldAnimate) {
        NeonSignStatus.attendingHasLoaded = true;
      }
    } else if (text == AppLang.lang.trending) {
      _shouldAnimate = !trendingHasLoaded;
      if (_shouldAnimate) {
        NeonSignStatus.trendingHasLoaded = true;
      }
    } else {
      _shouldAnimate = true;
    }
    if (_shouldAnimate) {
      return Stack(
        children: [
          Center(
            child: NeonBorderAnimation(
              rectHeight: rectHeightInner,
              rectWidth: rectWidthInner,
              isOuter: false,
            ),
          ),
          Center(
            child: NeonBorderAnimation(
              rectHeight: rectHeightOuter,
              rectWidth: rectWidthOuter,
              isOuter: true,
            ),
          ),
          Center(child: NeonTextAnimation(text: text)),
        ],
      );
    } else {
      return Stack(children: [
        Center(
          child: CustomPaint(
            painter: NeonBorderPainter(
                rectHeight: rectHeightInner,
                rectWidth: rectWidthInner,
                width: MediaQuery.of(context).size.width),
          ),
        ),
        Center(
          child: CustomPaint(
            painter: NeonBorderPainter(
                rectHeight: rectHeightOuter,
                rectWidth: rectWidthOuter,
                width: MediaQuery.of(context).size.width),
          ),
        ),
        Center(child: NeonText(text: text)),
      ]);
    }
  }
}
