import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({required this.name, required this.priceUSD, required this.imageUrl});

  final String name;
  final double priceUSD;
  final String imageUrl;
  
  @override
   List<Object?> get props => [name, priceUSD, imageUrl];
}
