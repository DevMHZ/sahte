import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahte/features/auth/login/data/api/login_api_service.dart';
import 'package:sahte/features/auth/login/data/repo/repo.dart';
import 'package:sahte/features/auth/login/presentation/cubit/login_cubit.dart';
//import 'package:sahte/features/services/data/api/services_api_service.dart';
//import 'package:sahte/features/services/data/repo/repo.dart';
//import 'package:sahte/features/services/presentation/cubit/services_cubit.dart';
import 'package:sahte/core/services/dio_factory.dart';

import '../../features/nurse_by_abdulkareem/data/api/services_api.dart';
import '../../features/nurse_by_abdulkareem/data/repo/services_repo.dart';
import '../../features/nurse_by_abdulkareem/presentation/cubit/service_cubit.dart';
 

final GetIt getIt = GetIt.instance;
setupService() async {
  await Hive.initFlutter();

  await Hive.openBox("settings");
  await Hive.openBox<String>("token");
  await Hive.openBox("auth_box");

  Dio dio = DioFactory.getDio();
//API SERVICESSS

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
 // getIt.registerLazySingleton<ServicesApiService>(() => ServicesApiService(dio));

  //abdulkareem api test
  getIt.registerLazySingleton<RestServices>(() => RestServices(dio));

//REPOOOOOOOOS

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  //getIt.registerLazySingleton<ServicesRepository>(() => ServicesRepository(getIt()));

  //abdulkareem repo test
  getIt.registerLazySingleton<ServicesRepository>(() => ServicesRepository(getIt()));



//CUBIITSS HEERE

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));

  //abdulkareem cubit test
  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));
}
