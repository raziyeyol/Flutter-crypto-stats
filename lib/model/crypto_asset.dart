class CryptoAsset {
  String assetId;
  String url;

  CryptoAsset(this.assetId, this.url);

  CryptoAsset.fromJson(Map<String, dynamic> json)
      : assetId = json['asset_id'],
        url = json['url'].toString();
}
