import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String getLocalizedField(BuildContext context, {String? en, String? ar}) {
  final locale = context.locale.languageCode;
  return locale == 'ar' ? (ar ?? en ?? '') : (en ?? ar ?? '');
}
