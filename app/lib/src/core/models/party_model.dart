// ignore_for_file: overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../entities/party.dart';
import 'party_theme_model.dart';
import 'user_model.dart';

class PartyModel extends Party {
  PartyModel();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["name"] = name;
    map["theme"] = (theme as PartyThemeModel).toMap();
    map["time"] = time.millisecondsSinceEpoch;
    map["location"] = location;
    map["position"] = position.toJson();
    map["host"] = (host as UserModel).toMap();
    map["cohosts"] = cohosts.map((cohost) => (cohost as UserModel).toMap());
    map["participants"] =
        participants.map((participant) => (participant as UserModel).toMap());
    return map;
  }

  Map<String, dynamic> toSnapshot() {
    var map = toMap();
    return map;
  }

  factory PartyModel.fromMap(Map<String, dynamic> map) {
    PartyModel partyModel = PartyModel();
    if (map["name"] != null) partyModel.name = map["name"] as String;
    if (map["theme"] != null)
      partyModel.theme = PartyThemeModel.fromMap(map["theme"]);
    if (map["time"] != null)
      partyModel.time = DateTime.fromMicrosecondsSinceEpoch(map["time"] as int);
    if (map["location"] != null)
      partyModel.location = map["location"] as String;
    if (map["position"] != null)
      partyModel.position = Position.fromMap(map["postion"]);
    if (map["host"] != null) partyModel.host = UserModel.fromMap(map["host"]);
    if (map["cohosts"] != null)
      partyModel.cohosts = (map["cohosts"] as List)
          .map((cohost) => UserModel.fromMap(cohost))
          .toList();
    if (map["participants"] != null)
      partyModel.participants = (map["participants"] as List)
          .map((participant) => UserModel.fromMap(participant))
          .toList();
    return partyModel;
  }

  factory PartyModel.fromSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return PartyModel.fromMap(map);
  }
}
