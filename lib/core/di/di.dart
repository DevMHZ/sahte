import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahte/auth/login/data/api/login_api_service.dart';
import 'package:sahte/auth/login/data/repo/repo.dart';
import 'package:sahte/auth/login/presentation/cubit/login_cubit.dart';
import 'package:sahte/core/services/dio_factory.dart';
 

final GetIt getIt = GetIt.instance;
setupService() async {
  await Hive.initFlutter();

  await Hive.openBox("settings");
  await Hive.openBox<String>("token");

  Dio dio = DioFactory.getDio();
//API SERVICESSS

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
//REPOOOOOOOOS
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
//CUBIITSS HEERE

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
