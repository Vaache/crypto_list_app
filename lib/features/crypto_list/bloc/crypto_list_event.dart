part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {}

class LoadCrypyoList extends CryptoListEvent {
  final Completer? completer;

  LoadCrypyoList({this.completer});

  @override
  List<Object?> get props => [completer];
}
