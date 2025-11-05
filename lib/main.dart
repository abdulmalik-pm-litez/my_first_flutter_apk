import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firstprojectflutter/firebase_options.dart';
import 'package:firstprojectflutter/crypto_coins_list_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin_details.dart';

void main() async {
  //Метод запуска приложения
  //WidgetsFlutterBinding.ensureInitialized();

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();   
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  

  final talker = TalkerFlutter.init();
  //Расширенный обработчик ошибок и регистратор для приложений Dart и Flutter
  //Можно узнать с помощью лога что за ошибка

  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  // GetIt.I<Talker>().error('Talker started...');
  // GetIt.I<Talker>().info('Talker started...');

  const cryptoCoinBoxName = 'crypto_coins_box';

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.info(app.options.projectId);

  await Hive.initFlutter();
  
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailAdapter());
  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinBoxName);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(printResponseData: false),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox),
  );
  //.registerSingleton - паттерн который означает какая-то сущность была создана только один раз и больше быть не может
  //.registerLazySingleton - который создается при необходимости запроса

  FlutterError.onError = (details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);

  FlutterNativeSplash.remove();
  
  runZonedGuarded(() => runApp(const CryptoCurrenciesListApp()), (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
