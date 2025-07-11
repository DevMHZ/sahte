import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahte/core/helper/size.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaSize.height(context) - 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 250.h,
              child:Text(
                'assets/animations/empty.json',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
