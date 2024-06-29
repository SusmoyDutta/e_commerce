import 'package:flutter/material.dart';

class ShowSnakeBarMessage extends StatelessWidget {
  const ShowSnakeBarMessage({
    super.key,
    required this.title,
  });

 final String title;

  @override
  Widget build(BuildContext context) {
    return  ScaffoldMessenger(
      child: SnackBar(
        content: Text(title),
      ),
    );
  }
}
