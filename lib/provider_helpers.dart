import 'package:flutter_riverpod/flutter_riverpod.dart';

final tbaApiKeyProvider = Provider<String>((ref) {
  const key = String.fromEnvironment('TBA_API_KEY');
  return key;
});
