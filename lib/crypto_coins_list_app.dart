import 'package:flutter/material.dart';
import 'package:firstprojectflutter/router/router.dart';
import 'package:firstprojectflutter/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});
  //StatelessWidget - нет своего состояния, он может только построить, нет своего build
  //StatefulWidget - есть свое состояния

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Есть WidgetsApp переменная
      //MaterialApp это стандартная
      title: 'CryptoCurrenciesListApp',
      theme: darkTheme,
      routes: routes,
      //#home: const CryptoListScreen(),
      //Задает базовую страницу приложения
      //MyHomePage - передавать кастомизацию для title
      //home - не прописывается когда используется routes

      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),

      ],
      //navigatorObservers - наблюдатель за навигацией, следить за тем какие страницы открываются
    );
  }
}