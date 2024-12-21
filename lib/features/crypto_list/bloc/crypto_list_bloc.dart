import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsReposytori) : super(CryptoListInitial()) {
    on<LoadCrypyoList>((event, emit) async {
      try {
        if (state is! CryproListLoaded) {
          emit(CryproListLoading());
        }
        final coinsList = await coinsReposytori.getCoinsList();
        emit(CryproListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadedFailuer(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsReposytori;
}
