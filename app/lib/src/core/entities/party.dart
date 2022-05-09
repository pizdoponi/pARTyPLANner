import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import 'party_theme.dart';
import 'user.dart';

@immutable

/// The party entity.
class Party extends Equatable {
  /// [name] of the [Party].
  late final String name;

  /// Defines the [PartyTheme] of the [Party].
  late final PartyTheme theme;

  /// Defines the [time] the [Party] takes place at.
  late final DateTime time;

  /// The [location] of the [Party]
  ///
  /// FIXME: Should the location be mandatory?
  late final Position location;

  /// [host] of the [Party]
  late final User host;

  /// If there are multiple hosts, they are defined here.
  ///
  /// The main host is [host].
  /// [cohosts] have the same privilages as the [host].
  /// However, for the purpouse of administration, the [host] is the main admin.
  late final List<User> cohosts;

  /// The [User]s that have attended / will be attending the [Party]
  late final List<User> participants;

  // TODO: make constructor fields not requried; assign them later in initialization
  Party({
    required this.name,
    required this.theme,
    required this.time,
    required this.location,
    required this.host,
    List<User>? cohosts,
    required this.participants,
  })  : assert(time.isAfter(DateTime.now())),
        cohosts = cohosts ?? const [];

  @override
  List<Object?> get props => [name, host];

  @override
  bool? get stringify => true;

  Party copyWith({
    String? name,
    PartyTheme? theme,
    DateTime? time,
    Position? location,
    User? host,
    List<User>? cohosts,
    List<User>? participants,
  }) {
    return Party(
      name: name ?? this.name,
      theme: theme ?? this.theme,
      time: time ?? this.time,
      location: location ?? this.location,
      host: host ?? this.host,
      cohosts: cohosts ?? this.cohosts,
      participants: participants ?? this.participants,
    );
  }
}
