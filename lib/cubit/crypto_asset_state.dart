part of 'crypto_asset_cubit.dart';

@immutable
abstract class CryptoAssetState {}

class CryptoInitial extends CryptoAssetState {}

class CryptoLoaded extends CryptoAssetState {
  final List<CryptoAsset> cryptoAssets;

  CryptoLoaded({required this.cryptoAssets});
}
