import 'package:firstprojectflutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD,EUR',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        //priceInUSD: ((e.value as Map<String, dynamic>)['USD'] as num).toDouble(),
      );
    }).toList();
    return cryptoCoinsList;
    //debugPrint(response.toString());
    //debugPrint - будет работать если приложения запущено в режиме Debug
    //print - будет работать если приложения запущено в режиме Релиз
  }
}

//async - асинхронный метод, этот метод который неизвестно когда закончится
//Dio().get - клиент для взаимодействия с сетью
//.get - это метод для взаимодействия с сетью
