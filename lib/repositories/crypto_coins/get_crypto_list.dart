import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetCryptoList {
  Future<List<CryptoCoin>> getCryptoCoinList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD');
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;

    final cryptoList = dataRAW.entries.map((e) {
      final dataUSD =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final priceUSD = dataUSD['PRICE'];
      final imageUrl = dataUSD['IMAGEURL'];
      return CryptoCoin(name: e.key, priceUSD: priceUSD, imageUrl: "https://www.cryptocompare.com/$imageUrl");
    }).toList();

    return cryptoList;
  }
}
