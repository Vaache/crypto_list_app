import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_detial_event.dart';
part 'crypto_coin_detial_state.dart';

class CryptoListDetialBloc extends Bloc<CryptoListDetialEvent, CryptoListDetialState> {
  CryptoListDetialBloc() : super(CryptoListDetialInitial()) {
    on<LoadCryptoListDetial>((event, emit) {
    
    });
  }
}