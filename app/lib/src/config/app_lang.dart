import 'lang/english.dart';
import 'lang/lang.dart';
import 'lang/slovenian.dart';

class AppLang {
  static final Lang eng = English();
  static final Lang slo = Slovenian();

  // TODO: get the chosen lang from user profile (preffered settings)
  static final Lang _chosenLang = eng;

  static Lang get lang => _chosenLang;
}
