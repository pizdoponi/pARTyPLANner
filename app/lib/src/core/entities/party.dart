import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'party_theme.dart';
import 'user.dart';

/// The party entity.
class Party extends Equatable {
  /// [name] of the [Party].
  late final String name;

  /// Defines the [PartyTheme] of the [Party].
  late final PartyTheme theme;

  /// The [time] the [Party] takes place at.
  late final DateTime time;

  /// The [location] of the [Party].
  ///
  /// It is presented as a String to be displayed on screen.
  /// For actual geographical position, see [position]
  late final String location;

  /// Geographic [Position] where [Party] takes place.
  late final Position position;

  /// [host] of the [Party].
  late final User host;

  /// If there are multiple hosts, they are defined here.
  ///
  /// The main host is [host].
  /// [cohosts] have the same privilages as the [host].
  /// However, for the purpouse of administration, the [host] is the main admin.
  late final List<User> cohosts;

  /// The [User]s that have attended / will be attending the [Party]
  late final List<User> participants;

  /// Constructor receives all nullable variables
  /// to make it possible to return only certain attributes from an API call.
  ///
  /// **CAUTION: developers need to be aware at all times which atributes have been initialised**.
  /// Non-nullable variables are assigned to the class.
  // Party({
  //   String? name,
  //   PartyTheme? theme,
  //   DateTime? time,
  //   String? location,
  //   Position? position,
  //   User? host,
  //   List<User>? cohosts,
  //   List<User>? participants,
  // }) {
  //   if (name != null) {
  //     this.name = name;
  //   }
  //   if (theme != null) {
  //     this.theme = theme;
  //   }
  //   if (time != null) {
  //     this.time = time;
  //   }
  //   if (location != null) {
  //     this.location = location;
  //   }
  //   if (position != null) {
  //     this.position = position;
  //   }
  //   if (host != null) {
  //     this.host = host;
  //   }
  //   if (cohosts != null) {
  //     this.cohosts = cohosts;
  //   }
  //   if (participants != null) {
  //     this.participants = participants;
  //   }
  // }

  @override
  List<Object?> get props => [name, host];

  @override
  bool? get stringify => true;

  // Party copyWith({
  //   String? name,
  //   PartyTheme? theme,
  //   DateTime? time,
  //   String? location,
  //   Position? position,
  //   User? host,
  //   List<User>? cohosts,
  //   List<User>? participants,
  // }) {
  //   return Party(
  //     name: name ?? this.name,
  //     theme: theme ?? this.theme,
  //     time: time ?? this.time,
  //     location: location ?? this.location,
  //     position: position ?? this.position,
  //     host: host ?? this.host,
  //     cohosts: cohosts ?? this.cohosts,
  //     participants: participants ?? this.participants,
  //   );
  // }
}
