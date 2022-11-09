import 'package:flutter/material.dart';

class details extends StatelessWidget {
  IconData icon;
  String type;
  details({required this.icon, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40.0,
        ),
        Text(type),
      ],
    );
  }
}
