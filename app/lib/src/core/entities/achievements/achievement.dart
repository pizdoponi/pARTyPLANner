import 'package:equatable/equatable.dart';

abstract class Achievement extends Equatable {
  final String name;
  final String description;
  final int xpAchieved;

  const Achievement(
      {required this.name,
      required this.description,
      required this.xpAchieved});

  @override
  List<Object?> get props => [name];

  @override
  bool? get stringify => true;

  Map<String, dynamic> toMap();
}
