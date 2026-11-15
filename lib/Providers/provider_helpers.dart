import 'package:flutter_riverpod/flutter_riverpod.dart';

final tbaApiKeyProvider = Provider<String>((ref) {
  const key = String.fromEnvironment('TBA_API_KEY');

  if (key.isEmpty) {
    throw StateError(
      'TBA_API_KEY is missing. '
      'Launch with --dart-define-from-file=api-keys.json.',
    );
  }

  return key;
});
