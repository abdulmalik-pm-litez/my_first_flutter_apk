import 'package:firstprojectflutter/crypto_coins_list_app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  //Метод запуска приложения

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio()),
    );
  //.registerSingleton - паттерн который означает какая-то сущность была создана только один раз и больше быть не может
  //.registerLazySingleton - который создается при запросе необходимости
  
  runApp(const CryptoCurrenciesListApp());
}
