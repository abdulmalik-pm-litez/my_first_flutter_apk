import 'dart:async';

import 'package:firstprojectflutter/crypto_coins_list_app.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  //Метод запуска приложения

  final talker = TalkerFlutter.init();
  //Расширенный обработчик ошибок и регистратор для приложений Dart и Flutter
  //Можно узнать с помощью лога что за ошибка

  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  // GetIt.I<Talker>().error('Talker started...');
  // GetIt.I<Talker>().info('Talker started...');

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
    ),
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio),
  );
  //.registerSingleton - паттерн который означает какая-то сущность была создана только один раз и больше быть не может
  //.registerLazySingleton - который создается при запросе необходимости

  FlutterError.onError = (details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const CryptoCurrenciesListApp()), (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
