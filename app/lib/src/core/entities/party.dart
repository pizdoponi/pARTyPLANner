import 'user.dart';

class Party {
  String name;
  DateTime time;
  List<User> participants;

  Party({
    required this.name,
    required this.time,
    required this.participants,
  });
}
