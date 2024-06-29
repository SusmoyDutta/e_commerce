import 'package:flutter/material.dart';

class AppActionsIcon extends StatelessWidget {
  const AppActionsIcon({
    super.key,
    required this.icon,
    required this.onTab,
  });

  final IconData icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTab,
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ));
  }
}
