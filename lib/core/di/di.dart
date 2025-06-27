import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahte/auth/login/data/api/login_api_service.dart';
import 'package:sahte/auth/login/data/repo/repo.dart';
import 'package:sahte/auth/login/presentation/cubit/login_cubit.dart';
import 'package:sahte/core/services/dio_factory.dart';
import 'package:sahte/nurse/presentation/cubit/services_cubit.dart';
import 'package:sahte/nurse/services/data/api/services_api_service.dart';
import 'package:sahte/nurse/services/data/repo/services_repository.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupService() async {
  await Hive.initFlutter();

  getIt.registerSingletonAsync<Dio>(() async => DioFactory.getDio());

  await getIt.isReady<Dio>();

  await Hive.openBox("settings");
  await Hive.openBox<String>("token");

  // Dio dio = DioFactory.getDio();
  //API SERVICESSS

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(getIt()));
  //REPOOOOOOOOS
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  //CUBIITSS HEERE

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<ServicesApiService>(
    () => ServicesApiService(getIt()),
  );
  getIt.registerLazySingleton<ServicesRepository>(
    () => ServicesRepository(getIt()),
  );

  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));
}
