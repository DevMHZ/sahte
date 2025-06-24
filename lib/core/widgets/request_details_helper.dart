import 'package:flutter/material.dart';

class RequestDetailsHelper {
  static Widget buildHeaderSection({
    required BuildContext context,
    required String title,
    required String code,
    required String status,
    IconData? customIcon,
  }) {
    final theme = Theme.of(context);
    final Color statusColor;
    final String statusText;
    final IconData icon;

    switch (status.toLowerCase()) {
      case 'in-progress':
        statusColor = Colors.orange;
        statusText = 'In Progress';
        icon = Icons.timelapse;
        break;
      case 'approved':
        statusColor = Colors.green;
        statusText = 'Approved';
        icon = Icons.check_circle;
        break;
      case 'rejected':
        statusColor = Colors.red;
        statusText = 'Rejected';
        icon = Icons.cancel;
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Pending';
        icon = Icons.pending;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                customIcon ?? icon,
                size: 30,
                color: statusColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Request #$code',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
            Chip(
              backgroundColor: statusColor.withOpacity(0.2),
              label: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a section card with title and content
  static Widget buildSectionCard({
    required BuildContext context,
    required String title,
    required List<Widget> children,
    EdgeInsetsGeometry? padding,
  }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  // Builds an info row with label and value
  static Widget buildInfoRow({
    required BuildContext context,
    required String label,
    required String value,
    double labelWidth = 100,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          SizedBox(
            width: labelWidth,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value.isEmpty ? 'N/A' : value,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  // Builds an approval step widget
  static Widget buildApprovalStep({
    required BuildContext context,
    required String role,
    required String userName,
    required String status,
    required int order,
    String? additionalInfo,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final statusLower = status.toLowerCase();

    Color statusColor;
    IconData icon;
    String statusText;

    switch (statusLower) {
      case 'in-progress':
        statusColor = Colors.orange;
        icon = Icons.timelapse;
        statusText = 'In Progress';
        break;
      case 'approved':
        statusColor = Colors.green;
        icon = Icons.check_circle;
        statusText = 'Approved';
        break;
      case 'rejected':
        statusColor = Colors.red;
        icon = Icons.cancel;
        statusText = 'Rejected';
        break;
      default:
        statusColor = Colors.grey;
        icon = Icons.pending;
        statusText = 'Pending';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: statusColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                if (userName.isNotEmpty)
                  Text(
                    userName,
                    style: theme.textTheme.bodyMedium,
                  ),
                if (additionalInfo != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    additionalInfo,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Step $order',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        statusText,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Builds an attachment item
  static Widget buildAttachmentItem({
    required BuildContext context,
    required String url,
    required String type,
    required VoidCallback onTap,
    String? displayName,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.blueGrey[800] : Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.attach_file,
          color: theme.colorScheme.primary,
        ),
      ),
      title: Text(
        displayName ?? url.split('/').last,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'Type: $type',
        style: theme.textTheme.bodySmall,
      ),
      trailing: Icon(
        Icons.download,
        color: theme.colorScheme.primary,
      ),
      onTap: onTap,
    );
  }

  // Builds an empty state widget
  static Widget buildEmptyState({
    required BuildContext context,
    required String message,
    IconData icon = Icons.info_outline,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
