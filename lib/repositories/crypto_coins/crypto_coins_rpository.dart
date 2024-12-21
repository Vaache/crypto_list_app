import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRpository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRpository({required this.dio});

  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,DOV,CAG&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;

    final cryptoList = dataRAW.entries.map((e) {
      final dataUSD =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final priceUSD = dataUSD['PRICE'];
      final imageUrl = dataUSD['IMAGEURL'];
      return CryptoCoin(
          name: e.key,
          priceUSD: priceUSD,
          imageUrl: "https://www.cryptocompare.com/$imageUrl");
    }).toList();

    return cryptoList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) {
    // TODO: implement getCoinDetails
    throw UnimplementedError();
  }
}
