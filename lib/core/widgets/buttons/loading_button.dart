import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahte/core/helper/size.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/core/widgets/loading.dart';
 
class LoadingButton extends StatelessWidget {
  final String buttonText;
  final Future<dynamic>? Function()? onPressed;
  final bool isLoading;
  final BoxBorder? border;
  final bool isDisable;
  final Widget? widget;
  final Color? bagColor;
  final Color? textColors;

  const LoadingButton({
    super.key,
    required this.buttonText,
    this.isDisable = false,
    this.border,
    required this.onPressed,
    this.widget,
    this.textColors,
    this.bagColor,
    required this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (isLoading || onPressed == null)
            ? null
            : () async {
                FocusScope.of(context).unfocus();

                await onPressed!();
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: MediaSize.width(context),
          height: 50.h,
          decoration: BoxDecoration(
            color: isDisable
                ? (bagColor ?? Colors.transparent)
                : (bagColor ?? Theme.of(context).colorScheme.primary),
            border: border ??
                Border.all(
                  color: isDisable
                      ? (bagColor ??
                          (Theme.of(context).brightness == Brightness.dark
                              ? const Color.fromARGB(255, 95, 93, 93)
                              : Colors.black))
                      : Colors.transparent,
                  width: 1.5,
                ),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? buildLoading(context)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText,
                      style: AppTextStyles.headlineMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    if (widget != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: widget!,
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
