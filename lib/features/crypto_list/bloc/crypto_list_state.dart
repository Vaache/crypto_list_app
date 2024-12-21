part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryproListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryproListLoaded extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryproListLoaded({required this.coinsList});
  
  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadedFailuer extends CryptoListState {
  final Object? exception;

  CryptoListLoadedFailuer({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}
