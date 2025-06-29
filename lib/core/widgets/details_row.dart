import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahte/core/style/design_tokens.dart';

class DetailsRowWidget extends StatelessWidget {
  final String title;
  final String detail;
  const DetailsRowWidget({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium(context),
          ),
          Text(
            detail.tr(),
            style: AppTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }
}
