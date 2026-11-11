// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String,
  phoneE164: json['phoneE164'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthDate: DateTime.parse(json['birthDate'] as String),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'phoneE164': instance.phoneE164,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'birthDate': instance.birthDate.toIso8601String(),
};

_NewUser _$NewUserFromJson(Map<String, dynamic> json) => _NewUser(
  phoneE164: json['phoneE164'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthDate: DateTime.parse(json['birthDate'] as String),
);

Map<String, dynamic> _$NewUserToJson(_NewUser instance) => <String, dynamic>{
  'phoneE164': instance.phoneE164,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'birthDate': instance.birthDate.toIso8601String(),
};

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  userId: json['userId'] as String,
  phoneE164: json['phoneE164'] as String,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'userId': instance.userId,
  'phoneE164': instance.phoneE164,
};
