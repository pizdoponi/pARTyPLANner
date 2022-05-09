import 'user.dart';

class Party {
  String name;
  DateTime time;
  List<User> participants;
  String location;
  String theme;

  Party({
    required this.name,
    required this.time,
    required this.participants,
    required this.location,
    required this.theme
  });
}
