import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/widgets/app_bar.dart';
import 'package:sahte/core/widgets/loading.dart';
import 'package:sahte/core/widgets/buttons/button.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/features/services/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/services/presentation/widgets/services_list.dart';
import 'package:sahte/features/services/presentation/widgets/add_service_button.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServicesCubit>().fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "my_services".tr(), centerTitle: true),
      body: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          return state.when(
            initial: () => buildLoading(context),
            loading: () => buildLoading(context),
            success: (services) => ServicesList(services: services),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: AppSpacing.iconXxl,
                    color: AppColors.error,
                  ),
                  SizedBox(height: AppSpacing.spacing16),
                  Text(
                    '${'error'.tr()}: $message. ',
                    style: AppTextStyles.bodyLarge(context),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.spacing16),
                  CustomButton(
                    text: 'retry'.tr(),
                    onPressed: () {
                      context.read<ServicesCubit>().fetchServices();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: const AddServiceButton(),
    );
  }
}
