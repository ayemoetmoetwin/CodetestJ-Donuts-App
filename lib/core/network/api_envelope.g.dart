// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiMeta _$ApiMetaFromJson(Map<String, dynamic> json) =>
    _ApiMeta(path: json['path'] as String, version: json['version'] as String);

Map<String, dynamic> _$ApiMetaToJson(_ApiMeta instance) => <String, dynamic>{
  'path': instance.path,
  'version': instance.version,
};

_ApiEnvelope _$ApiEnvelopeFromJson(Map<String, dynamic> json) => _ApiEnvelope(
  meta: ApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
  data: json['data'] as Map<String, dynamic>?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$ApiEnvelopeToJson(_ApiEnvelope instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data,
      'error': instance.error,
    };
