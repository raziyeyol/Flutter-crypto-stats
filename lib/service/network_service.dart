import 'package:dio/dio.dart';
import '../helpers/constants.dart';

abstract class INetworkService {
  Future<List<dynamic>> getCryptoAssets();
}

class NetworkService implements INetworkService {
  var _dioClient;
  NetworkService(this._dioClient);

  @override
  Future<List<dynamic>> getCryptoAssets() async {
    try {
      final result = await _dioClient.get<List<dynamic>>(
        baseUrl,
        options: Options(
          headers: <String, String>{'X-CoinAPI-Key': '{$apiKey}'},
        ),
      );

      return result.data!;
    } catch (e) {
      return [];
    }
  }
}
