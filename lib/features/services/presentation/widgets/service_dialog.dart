import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/core/widgets/text_form_fiels.dart';
import 'package:sahte/core/widgets/buttons/button.dart';
import 'package:sahte/features/services/model/services.dart';

class ServiceDialog extends StatefulWidget {
  final Function(String name, String price) onConfirm;
  final Services? serviceToUpdate;

  const ServiceDialog({
    super.key,
    required this.onConfirm,
    this.serviceToUpdate,
  });

  @override
  State<ServiceDialog> createState() => _ServiceDialogState();
}

class _ServiceDialogState extends State<ServiceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  bool get _isEditing => widget.serviceToUpdate != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _nameController.text = widget.serviceToUpdate!.name;
      _priceController.text = widget.serviceToUpdate!.price;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onConfirm(_nameController.text, _priceController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text(
          _isEditing ? 'update_service'.tr() : "add_new_service".tr(),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                controller: _nameController,
                label: 'service_name'.tr(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'service_name_required'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSpacing.spacing16),
              CustomTextFormField(
                controller: _priceController,
                label: 'price'.tr(),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'price_required'.tr();
                  }
                  if (double.tryParse(value) == null) {
                    return 'price_invalid'.tr();
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'.tr()),
          ),
          CustomButton(
            text: _isEditing ? 'update'.tr() : 'add'.tr(),
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
