import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'achievements/achievement.dart';
import 'party.dart';
import 'social_media/social_media_account.dart';

class User extends Equatable {
  late final String? name;
  late final String? surname;
  late final String username;
  late final int? age;
  late final List<User> friends;
  late final List<Party> attendedParties;
  late final List<Achievement> achievements;
  late final List<SocialMediaAccount> socialMediaAccounts;
  late final int xp;

  User({
    this.name,
    this.surname,
    required this.username,
    this.age,
    required this.friends,
    required this.xp,
    required this.attendedParties,
    required this.achievements,
    required this.socialMediaAccounts,
  });

  @override
  List<Object> get props => [username];

  User copyWith({
    String? name,
    String? surname,
    String? username,
    int? age,
    List<User>? friends,
    List<Party>? attendedParties,
    List<Achievement>? achievements,
    List<SocialMediaAccount>? socialMediaAccounts,
    int? xp,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      age: age ?? this.age,
      friends: friends ?? this.friends,
      attendedParties: attendedParties ?? this.attendedParties,
      achievements: achievements ?? this.achievements,
      socialMediaAccounts: socialMediaAccounts ?? this.socialMediaAccounts,
      xp: xp ?? this.xp,
    );
  }
}
