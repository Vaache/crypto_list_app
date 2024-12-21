import 'dart:async';
import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCrypyoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currencies List App'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCrypyoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryproListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 30),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.coinsList.length,
                    itemBuilder: (context, idx) {
                      final coin = state.coinsList[idx];
                      return CryptoCoinTile(coin: coin);
                    });
              }

              if (state is CryptoListLoadedFailuer) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Something went wrong',
                      style: TextStyle(
                        color: Colors.white, // Устанавливаем белый цвет текста
                        fontSize: 24, // Размер текста
                        fontWeight: FontWeight.bold, // Полужирное начертание
                      ),
                    ),
                    const Text(
                      'Please try again',
                      style: TextStyle(
                        color: Colors.white, // Белый цвет текста
                        fontSize: 18, // Размер текста
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCrypyoList());
                        },
                        child: const Text('Try again')),
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )

        // (_coinList == null)
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 30),
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemCount: _coinList!.length,
        //         itemBuilder: (context, idx) {
        //           final coin = _coinList![idx];
        //           return CryptoCoinTile(coin: coin);
        //         }),
        );
  }
}
