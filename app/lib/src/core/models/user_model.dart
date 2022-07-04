import '../entities/user.dart';

class UserModel extends User {
  UserModel();

  Map<String, dynamic> toMap() {
    // TODO: implement toMap()
    Map<String, dynamic> map = {};
    map["username"] = name;
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap()
    UserModel userModel = UserModel();
    if (map["username"] != null) userModel.username = map["username"] as String;
    throw UnimplementedError();
  }
}
