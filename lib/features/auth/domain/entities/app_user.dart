import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String phoneE164,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@freezed
abstract class NewUser with _$NewUser {
  const factory NewUser({
    required String phoneE164,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  }) = _NewUser;

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);
}

@freezed
abstract class Session with _$Session {
  const factory Session({required String userId, required String phoneE164}) =
      _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
