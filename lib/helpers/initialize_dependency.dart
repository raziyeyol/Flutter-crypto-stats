import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '/service/network_service.dart';
import '/service/repository.dart';
import '/cubit/live_prices_cubit.dart';

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

  // Cubit factory
  getIt.registerFactory(() => LivePricesCubit(mock: mock));
}
