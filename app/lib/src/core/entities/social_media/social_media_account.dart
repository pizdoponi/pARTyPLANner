// import 'social_media_platforms.dart';

// class SocialMediaAccount {
//   final SocialMediaPlatform platform;
//   final String username;
// }

import 'package:freezed_annotation/freezed_annotation.dart';

import 'social_media_platforms.dart';

part 'social_media_account.freezed.dart';
part 'social_media_account.g.dart';

@freezed
class SocialMediaAccount with _$SocialMediaAccount {
  factory SocialMediaAccount({
    required SocialMediaPlatform platform,
    required String username,
  }) = _SocialMediaAccount;

  factory SocialMediaAccount.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAccountFromJson(json);
}
