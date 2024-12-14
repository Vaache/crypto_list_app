import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List App'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, idx) {
            const coinNAme = 'Bitcoin';
            return const CryptoCoinTile(coinNAme: coinNAme);
          }),
    );
  }
}


