import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/core/widgets/app_bar.dart';
import 'package:sahte/core/widgets/buttons/button.dart';
import 'package:sahte/core/widgets/loading.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/cubit/service_cubit.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/cubit/service_state.dart';

import '../widgets/add_service_Dialog.dart';
import '../widgets/services_list.dart' show ServicesList;

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ServicesCubit>().fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الخدمات', centerTitle: true),
      body: BlocConsumer<ServicesCubit, MyServicesState>(
    listener: (context, state) {
      if (state is ServiceOperationSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message),backgroundColor: AppColors.success,),
        );
      } else if (state is ServiceOperationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage), backgroundColor: AppColors.error),
        );
      }
    },
    builder: (context, state) {
      if (state is ServicesLoading || state is ServiceOperationLoading) {
        return buildLoading(context);
      } else if (state is ServicesSuccess) {
        return ServicesList(services: state.services);
      } else if (state is ServicesFailure) {
        return Center(
          child: Padding(
            padding:  EdgeInsets.all(AppSpacing.spacing24),
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
                  'حدث خطأ: ${state.errorMessage}',
                  style: AppTextStyles.bodyLarge(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSpacing.spacing16),
                CustomButton(
                  text: 'إعادة المحاولة',
                  onPressed: () {
                    context.read<ServicesCubit>().fetchServices();
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return Center(
          child: Text(
            'لا توجد بيانات متاحة',
            style: AppTextStyles.bodyMedium(context),
          ),
        );
      }
    },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddServiceDialog(context);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
