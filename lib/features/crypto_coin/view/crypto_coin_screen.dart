
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    //проверка во время разработки (debug mode)
    //assert если используется не используем условие 'if' и будем использовать coinName = args as String;

    // if (args == null) {
    //   log('You must provide args');
    //   //Лог о том что не были переданы аргументы
    //   return;
    // }

    // if (args is! String) {
    //   log('You must provide String args');
    //   return;
    // }

    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...'), centerTitle: true),
    );
  }
}
