// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_flow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthFlowState _$AuthFlowStateFromJson(Map<String, dynamic> json) =>
    _AuthFlowState(
      mode:
          $enumDecodeNullable(_$AuthModeEnumMap, json['mode']) ??
          AuthMode.register,
      phone: json['phone'] as String? ?? '',
      phoneTouched: json['phoneTouched'] as bool? ?? false,
      banner:
          $enumDecodeNullable(_$AuthBannerEnumMap, json['banner']) ??
          AuthBanner.none,
      otp: json['otp'] as String? ?? '',
      otpFailures: (json['otpFailures'] as num?)?.toInt() ?? 0,
      otpLocked: json['otpLocked'] as bool? ?? false,
      otpError: json['otpError'] as bool? ?? false,
      shake: (json['shake'] as num?)?.toInt() ?? 0,
      resendAt: json['resendAt'] == null
          ? null
          : DateTime.parse(json['resendAt'] as String),
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      nameTouched: json['nameTouched'] as bool? ?? false,
      month: json['month'] as String? ?? '',
      day: json['day'] as String? ?? '',
      year: json['year'] as String? ?? '',
      dobTouched: json['dobTouched'] as bool? ?? false,
      submitting: json['submitting'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthFlowStateToJson(_AuthFlowState instance) =>
    <String, dynamic>{
      'mode': _$AuthModeEnumMap[instance.mode]!,
      'phone': instance.phone,
      'phoneTouched': instance.phoneTouched,
      'banner': _$AuthBannerEnumMap[instance.banner]!,
      'otp': instance.otp,
      'otpFailures': instance.otpFailures,
      'otpLocked': instance.otpLocked,
      'otpError': instance.otpError,
      'shake': instance.shake,
      'resendAt': instance.resendAt?.toIso8601String(),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'nameTouched': instance.nameTouched,
      'month': instance.month,
      'day': instance.day,
      'year': instance.year,
      'dobTouched': instance.dobTouched,
      'submitting': instance.submitting,
    };

const _$AuthModeEnumMap = {
  AuthMode.register: 'register',
  AuthMode.login: 'login',
};

const _$AuthBannerEnumMap = {
  AuthBanner.none: 'none',
  AuthBanner.notRegistered: 'notRegistered',
  AuthBanner.alreadyRegistered: 'alreadyRegistered',
};
