import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_envelope.freezed.dart';
part 'api_envelope.g.dart';

@freezed
abstract class ApiMeta with _$ApiMeta {
  const factory ApiMeta({required String path, required String version}) =
      _ApiMeta;

  factory ApiMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaFromJson(json);
}

@freezed
abstract class ApiEnvelope with _$ApiEnvelope {
  const ApiEnvelope._();

  const factory ApiEnvelope({
    required ApiMeta meta,
    Map<String, dynamic>? data,
    String? error,
  }) = _ApiEnvelope;

  factory ApiEnvelope.fromJson(Map<String, dynamic> json) =>
      _$ApiEnvelopeFromJson(json);

  bool get ok => error == null && data != null;
}
