part of 'crypto_coin_detial_bloc.dart';


abstract class CryptoListDetialState extends Equatable {}

class CryptoListDetialInitial extends CryptoListDetialState {
  @override
  List<Object?> get props => [];
}

class CryproListLoading extends CryptoListDetialState {
  @override
  List<Object?> get props => [];
}

class CryproListLoaded extends CryptoListDetialState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CryptoListDetialLoadedFailuer extends CryptoListDetialState {
  final Object? exception;

  CryptoListDetialLoadedFailuer({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}
