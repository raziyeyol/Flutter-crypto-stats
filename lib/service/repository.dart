import '/model/crypto_asset.dart';
import 'network_service.dart';

abstract class IRepository {
  Future<List<CryptoAsset>> getCryptoAssets();
}

class Repository implements IRepository {
  final INetworkService _networkService;

  Repository(this._networkService);

  @override
  Future<List<CryptoAsset>> getCryptoAssets() async {
    final result = await _networkService.getCryptoAssets();
    return result
        .map((dynamic e) => CryptoAsset.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class MockRepository implements IRepository {
  @override
  Future<List<CryptoAsset>> getCryptoAssets() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      CryptoAsset(
          assetId: 'BTC',
          url:
              'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/4caf2b16a0174e26a3482cea69c34cba.png'),
      CryptoAsset(
          assetId: 'ETH',
          url:
              'http://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/04836ff3bc4d4d95820e0155594dca86.png'),
      CryptoAsset(
          assetId: 'ADA',
          url:
              'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/2701173b1b7740f286939659359e225c.png'),
    ];
  }
}
