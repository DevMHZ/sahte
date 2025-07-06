import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahte/core/services/auth_storage_helper.dart';
import 'package:sahte/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:sahte/features/auth/login/presentation/screen/sign_in_screen.dart';
import 'package:sahte/features/services/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/services/presentation/screen/services_screen.dart';
import 'package:sahte/core/di/di.dart';
import 'package:sahte/core/router/rotue_names.dart';
import 'package:sahte/core/router/transaction.dart';

abstract class GoRouterApp {
  static bool isChecked = false;

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.signIn,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<LoginCubit>()),
              ],
              child: const SignInScreen(),
            ),
          );
        },
      ),

      GoRoute(
        path: RouteNames.nurseHomeScreen,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<ServicesCubit>()),
              ],
              child: const ServicesScreen(),
            ),
          );
        },
      ),
    ],
    redirect: (context, state) async {
      return await authRedirectLogic(state);
    },
  );
}

// GoRoute(
//   path: '/editStorageItem/:itemId',
//   builder: (context, state) {
//     final itemId = int.parse(state.pathParameters['itemId']!);

//     final storageRepository = StorageRepository();

//     return BlocProvider<StorageCubit>(
//       create: (context) => StorageCubit(storageRepository)
//         ..fetchStorageItemForEditing(itemId.toString()),
//       child: EditStorageScreen(
//         itemId: itemId,
//       ),
//     );
//   },
// ),

Future<String?> authRedirectLogic(GoRouterState state) async {
  final hasToken = await AuthStorageHelper.hasToken();
  final token = AuthStorageHelper.getToken().toString();
  print(token);
  final isAtLogin = state.uri.toString() == RouteNames.signIn;

  if (hasToken && isAtLogin) return RouteNames.nurseHomeScreen;
  if (!hasToken && !isAtLogin) return RouteNames.signIn;

  return null;
}
