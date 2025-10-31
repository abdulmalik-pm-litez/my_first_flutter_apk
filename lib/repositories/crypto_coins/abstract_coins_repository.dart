import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin_details.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode);
  // Future<dynamic> getCoinDetails(String currencyCode) async {}
  // Future<dynamic> getCoinsDetails(String currencyCode) async {}
}
