import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chopperClientProvider = Provider<ChopperClient>((ref) {
  final client = ChopperClient(
    baseUrl: Uri.parse('https://dummyjson.com'),
    converter: const JsonConverter(),
  );
  ref.onDispose(client.dispose);
  return client;
});
