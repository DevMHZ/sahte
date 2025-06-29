import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahte/core/style/design_tokens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.backgroundColor,
    this.centerTitle = true,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        ),
      ),
      leadingWidth: 60,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: theme.primaryColor),
                  onPressed: onBack ?? () => context.pop(),
                ),
              ),
            )
          : null,
      title: Text(title, style: AppTextStyles.bodyMedium(context)),
      centerTitle: centerTitle,
      actions: actions != null
          ? [
              // Add spacing before actions
              SizedBox(width: AppSpacing.spacing8),
              // Wrap actions with proper spacing
              ...actions!.map(
                (action) => Padding(
                  padding: EdgeInsets.only(right: AppSpacing.spacing8),
                  child: action,
                ),
              ),
              // Add final spacing after actions
              SizedBox(width: AppSpacing.spacing16),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
