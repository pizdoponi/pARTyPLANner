import '../entities/party_theme.dart';

class PartyThemeModel extends PartyTheme {
  PartyThemeModel();

  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    Map<String, dynamic> map = {};
    map["type"] = type;
    return map;
  }

  factory PartyThemeModel.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    PartyThemeModel partyThemeModel = PartyThemeModel();
    if (map["type"] != null) partyThemeModel.type = map["type"] as String;
    return partyThemeModel;
  }
}
