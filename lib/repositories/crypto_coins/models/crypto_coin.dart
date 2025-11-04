import 'package:equatable/equatable.dart';
import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    // required this.priceInUSD,
    // required this.imageUrl,
    required this.details,
  });


  @HiveField(0)
  final String name;
  // final double priceInUSD;
  // final String imageUrl;

  @HiveField(1)
  final CryptoCoinDetail details;

  @override
  List<Object?> get props => [name, details];
  //List<Object?> get props => [name, priceInUSD, imageUrl];
}


