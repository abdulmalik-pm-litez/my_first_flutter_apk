import 'package:dio/dio.dart';
import 'package:firstprojectflutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
    required this.cryptoCoinsBox,
    });

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

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
      final details = CryptoCoinDetail.fromJson(usdData);
      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  // Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
  //   final response = await dio.get(
  //     'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD,EUR',);
  //   final data = response.data as Map<String, dynamic>;
  //   final dataRaw = data['RAW'] as Map<String, dynamic>;
  //   final cryptoCoinsList = dataRaw.entries.map((e) {
  //     final usdData =
  //         (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
  //     final details = CryptoCoinDetail.fromJson(usdData);
  //     return CryptoCoin(name: e.key, details: details);
  //   }).toList();
  //   return cryptoCoinsList;
  // }

  // @override
  // Future<CryptoCoin> getCoinDetails(String currencyCode) async {
  //   try {
  //     final coin = await _fetchCoinDetailsFromApi(currencyCode);
  //     cryptoCoinsBox.put(currencyCode, coin);
  //     return coin;
  //   } catch (e, st) {
  //     GetIt.instance<Talker>().handle(e, st);
  //     return cryptoCoinsBox.get(currencyCode)!;
  //   }
  // }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);
    // final price = usdData['PRICE'];
    // final imageUrl = usdData['IMAGEURL'];
    // final toSymbol = usdData['TOSYMBOL'];
    // final lastUpdate = usdData['LASTUPDATE'];
    // final high24Hour = usdData['HIGH24HOUR'];
    // final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoin(
      name: currencyCode,
      details: details,
      // priceInUSD: price,
      // imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      // toSymbol: toSymbol,
      // lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      // high24Hour: high24Hour,
      // low24Hours: low24Hours,
    );
  }
}
     
    //debugPrint(response.toString());
    //debugPrint - будет работать если приложения запущено в режиме Debug
    //print - будет работать если приложения запущено в режиме Релиз

//async - асинхронный метод, этот метод который неизвестно когда закончится
//Dio().get - клиент для взаимодействия с сетью
//.get - это метод для взаимодействия с сетью
