import 'lang/english.dart';
import 'lang/lang.dart';
import 'lang/slovenian.dart';

class AppLang {
  static final Lang _eng = English();
  static final Lang _slo = Slovenian();

  // TODO: get the chosen lang from user profile (preffered settings)
  static final Lang _chosenLang = _eng;

  static Lang get lang => _chosenLang;
  // static List<Lang> get availableLangs => [_eng, _slo];
}
