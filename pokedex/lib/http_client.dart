import 'package:dio/dio.dart';
import 'package:pokedex/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

@riverpod
Dio httpClient(Ref ref) {
  // TODO: create options here, and feed them to `Dio`
  final client = Dio();
  // TODO: cleanup on dispose...

  final logger = TalkerDioLogger(
    talker: talker,
  );
  client.interceptors.add(logger);

  return client;
}
