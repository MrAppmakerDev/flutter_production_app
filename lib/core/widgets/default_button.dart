import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final bool isEnabled;

  const DefaultButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 12), // Default padding
    this.isEnabled = true, // Default enabled state
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: padding!,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(colorScheme),
            foregroundColor: _getForegroundColor(colorScheme),
            disabledBackgroundColor: _getDisabledBackgroundColor(colorScheme),
            disabledForegroundColor: _getDisabledForegroundColor(colorScheme),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    return backgroundColor ?? colorScheme.primary;
  }

  Color _getForegroundColor(ColorScheme colorScheme) {
    return textColor ?? colorScheme.onPrimary;
  }

  Color _getDisabledBackgroundColor(ColorScheme colorScheme) {
    return backgroundColor?.withValues(alpha: 128) ??
        colorScheme.onSurface.withValues(alpha: 128);
  }

  Color _getDisabledForegroundColor(ColorScheme colorScheme) {
    return textColor?.withValues(alpha: 128) ??
        colorScheme.onSurface.withValues(alpha: 128);
  }
}
