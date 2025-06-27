import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_asset.freezed.dart';
part 'crypto_asset.g.dart';

@freezed
class CryptoAsset with _$CryptoAsset {
  const factory CryptoAsset({
    required String assetId,
    required String url,
  }) = _CryptoAsset;

  factory CryptoAsset.fromJson(Map<String, dynamic> json) =>
      _$CryptoAssetFromJson(json);
}
