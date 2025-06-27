import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '/service/network_service.dart';
import '/service/repository.dart';
import '/cubit/live_prices_cubit.dart';
import '/service/crypto_ws_client.dart';
import '/helpers/constants.dart';

final getIt = GetIt.instance;

void initDependencies({required bool mock}) {
  // Dio for static endpoints (logos, user profile, etc.)
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
      )));

  // Network service
  getIt.registerLazySingleton<INetworkService>(
      () => NetworkService(getIt<Dio>()));

  // Repository (mock or live)
  if (mock) {
    getIt.registerLazySingleton<IRepository>(() => MockRepository());
  } else {
    getIt.registerLazySingleton<IRepository>(
        () => Repository(getIt<INetworkService>()));
  }

  // WebSocket client (mock or live)
  getIt.registerLazySingleton<CryptoWsClient>(
    () => mock ? MockWsClient() : CoinApiWsClient(apiKey: apiKey),
  );

  // Cubit factory
  getIt.registerFactory(() => LivePricesCubit(getIt<CryptoWsClient>()));
}
