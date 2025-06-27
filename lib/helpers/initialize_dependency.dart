import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '/service/network_service.dart';
import '/service/repository.dart';
import '/cubit/live_prices_cubit.dart';

final sl = GetIt.instance;

void initDependencies({required bool mock}) {
  // Dio for static endpoints (logos, user profile, etc.)
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
      )));

  // Network service
  sl.registerLazySingleton<INetworkService>(() => NetworkService(sl<Dio>()));

  // Repository (mock or live)
  if (mock) {
    sl.registerLazySingleton<IRepository>(() => MockRepository());
  } else {
    sl.registerLazySingleton<IRepository>(
        () => Repository(sl<INetworkService>()));
  }

  // Cubit factory
  sl.registerFactory(() => LivePricesCubit(mock: mock));
}
