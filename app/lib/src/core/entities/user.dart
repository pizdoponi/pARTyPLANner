import 'package:equatable/equatable.dart';

import 'achievements/achievement.dart';
import 'social_media/social_media_account.dart';

class User extends Equatable {
  late final String? name;
  late final String username;
  late final int? age;
  late final List<User> friends;
  late final List<Achievement> achievements;
  late final List<SocialMediaAccount> socialMediaAccounts;
  late final int xp;

  // ignore: prefer_const_constructors_in_immutables
  User({
    String? name,
    String? username,
    int? age,
    List<User>? friends,
    List<Achievement>? achievements,
    List<SocialMediaAccount>? socialMediaAccounts,
    int? xp,
  }) {
    if (name != null) this.name = name;
    if (username != null) this.username = username;
    if (age != null) this.age = age;
    if (friends != null) this.friends = friends;
    if (achievements != null) this.achievements = achievements;
    if (socialMediaAccounts != null)
      this.socialMediaAccounts = socialMediaAccounts;
    if (xp != null) this.xp = xp;
  }

  @override
  List<Object> get props => [username];

  User copyWith({
    String? name,
    String? username,
    int? age,
    List<User>? friends,
    List<Achievement>? achievements,
    List<SocialMediaAccount>? socialMediaAccounts,
    int? xp,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      age: age ?? this.age,
      friends: friends ?? this.friends,
      achievements: achievements ?? this.achievements,
      socialMediaAccounts: socialMediaAccounts ?? this.socialMediaAccounts,
      xp: xp ?? this.xp,
    );
  }
}
