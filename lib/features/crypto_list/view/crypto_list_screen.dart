import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/repositories/view.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _coinList;

  @override
  void initState() {
    _loadCryptoCoinList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List App'),
      ),
      body: (_coinList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 30),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _coinList!.length,
              itemBuilder: (context, idx) {
                final coin = _coinList![idx];
                return CryptoCoinTile(coin: coin);
              }),
    );
  }

  Future<void> _loadCryptoCoinList() async {
     _coinList = await GetCryptoList().getCryptoCoinList();
    setState(() {});
  }
}
