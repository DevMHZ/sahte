import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahte/core/widgets/loading.dart';

String formatDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

Future<List<XFile>> pickImages(BuildContext context) async {
  try {
    final pickedFiles = await ImagePicker().pickMultiImage(
      imageQuality: 70,
      maxWidth: 800,
    );
    return pickedFiles;
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to pick files: ${e.toString()}')),
    );
    return [];
  }
}

Widget buildAttachmentsSection({
  required List<XFile> attachments,
  required VoidCallback onAdd,
  required void Function(XFile) onRemove,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Attachments', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      if (attachments.isNotEmpty)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: attachments
              .map((file) => Chip(
                    label: Text(
                      file.name.length > 20
                          ? '${file.name.substring(0, 15)}...${file.name.substring(file.name.length - 5)}'
                          : file.name,
                    ),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () => onRemove(file),
                  ))
              .toList(),
        ),
      const SizedBox(height: 8),
      OutlinedButton.icon(
        icon: const Icon(Icons.attach_file),
        label: const Text('Add Supporting Documents'),
        onPressed: onAdd,
      ),
    ],
  );
}

Widget buildTextField(
    {required IconData icon,
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
    bool isNumeric = false}) {
  return TextFormField(
    keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
    controller: controller,
    maxLines: maxLines,
    readOnly: readOnly,
    onTap: onTap,
    validator: validator,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.grey[100],
      suffixIcon: suffixIcon,
    ),
  );
}

Widget buildDropdown<T>({
  required T value,
  required List<DropdownMenuItem<T>> items,
  required void Function(T?) onChanged,
  required String label,
}) {
  return DropdownButtonFormField<T>(
    value: value,
    items: items,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.grey[100],
    ),
  );
}

Future<void> pickDateRange({
  required BuildContext context,
  required void Function(DateTimeRange) onSelected,
}) async {
  final range = await showDateRangePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 365)),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
          ),
        ),
        child: child!,
      );
    },
  );
  if (range != null) onSelected(range);
}

Widget buildSwitchTile({
  required String title,
  required bool value,
  required void Function(bool) onChanged,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.grey[300]!),
    ),
    child: SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    ),
  );
}

Widget buildDateRangeField({
  required DateTimeRange? dateRange,
  required VoidCallback onTap,
}) {
  return buildTextField(
    icon: Icons.date_range,
    controller: TextEditingController(
      text: dateRange != null
          ? '${formatDate(dateRange.start)} - ${formatDate(dateRange.end)}'
          : '',
    ),
    label: 'Date Range',
    readOnly: true,
    onTap: onTap,
    suffixIcon: const Icon(Icons.calendar_today),
    validator: (val) => dateRange == null ? 'Required' : null,
  );
}

Widget buildSingleDateField({
  required DateTime selectedDate,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: InputDecorator(
      decoration: InputDecoration(
        labelText: "Start Date",
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('yyyy-MM-dd').format(selectedDate),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    ),
  );
}

class DoneButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry? padding;

  const DoneButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    this.text = 'Done',
    this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 14,
    this.elevation = 2,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width ?? double.infinity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ElevatedButton.icon(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: isLoading
                ? const SizedBox(key: ValueKey('loading-icon'))
                : Icon(
                    Icons.check_circle_outlined,
                    size: 22,
                    key: const ValueKey('done-icon'),
                  ),
          ),
          label: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? buildLoading(context)
                : Text(
                    text,
                    key: const ValueKey('text'),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: foregroundColor ?? Colors.white,
                    ),
                  ),
          ),
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.white,
            backgroundColor: backgroundColor ?? theme.primaryColor,
            disabledBackgroundColor:
                (backgroundColor ?? theme.primaryColor).withOpacity(0.7),
            padding: padding ?? const EdgeInsets.symmetric(vertical: 18),
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            animationDuration: const Duration(milliseconds: 300),
            enableFeedback: true,
            shadowColor: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
