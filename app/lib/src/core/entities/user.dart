class User {
  String? name;
  String? surname;
  String username;
  int? age;
  List<User> friends;
  int xp;

  User({
    this.name,
    this.surname,
    required this.username,
    this.age,
    required this.friends,
    required this.xp,
  });
}
