import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahte/core/manger/manager_cubit.dart';
import 'package:sahte/core/manger/manager_state.dart';
import 'package:sahte/core/router/router.dart';
import 'package:sahte/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocProvider(
      create: (_) => ManagerCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ManagerCubit, ManagerState>(
            builder: (context, state) {
              return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: state.themeMode == ThemeMode.light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
                  routerConfig: GoRouterApp.router,
                 );
            },
          );
        },
      ),
    );
  }
}
