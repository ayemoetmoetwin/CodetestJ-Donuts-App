import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';

final _lettersAndSpaces = RegExp(r'^[\p{L}\p{M} ]+$', unicode: true);

String? validateFirstName(String input) {
  return _validate(input, required: true);
}

String? validateLastName(String input) {
  return _validate(input, required: false);
}

String? _validate(String input, {required bool required}) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) {
    return required ? 'required' : null;
  }
  if (trimmed.length > NamePolicy.maxLength) {
    return 'tooLong';
  }
  if (!_lettersAndSpaces.hasMatch(trimmed)) {
    return 'invalidChars';
  }
  return null;
}
