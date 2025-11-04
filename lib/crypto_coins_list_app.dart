import 'package:firstprojectflutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firstprojectflutter/router/router.dart';
import 'package:firstprojectflutter/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  State<CryptoCurrenciesListApp> createState() =>
      _CryptoCurrenciesListAppState();
}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp> {
  //StatelessWidget - нет своего состояния, он может только построить, нет своего build

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Есть WidgetsApp переменная
      //MaterialApp это стандартная
      title: 'CryptoCurrenciesList',
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
      ],
      
      supportedLocales: S.delegate.supportedLocales,

      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>())
          ],
      //navigatorObservers - наблюдатель за навигацией, следить за тем какие страницы открываются
      ),
    );
  }
}

// routes: routes,
      //#home: const CryptoListScreen(),
      //Задает базовую страницу приложения
      //MyHomePage - передавать кастомизацию для title
      //home - не прописывается когда используется routes