import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class ETCHomeScreenButton extends StatelessWidget {
  ETCHomeScreenButton({
    required this.icon,
    required this.label,
    required this.testKey,
    required this.onPress,
  });
  final Key testKey;
  final String label;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodyLarge!.color!;
    return TextButton(
      onPressed: onPress,
      key: this.testKey,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.padding * 1.5),
      ).copyWith(
          overlayColor: WidgetStateColor.resolveWith(
        (states) => color.withOpacity(0.1),
      )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12 + AppDimensions.ratio * 6,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
