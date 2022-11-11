import 'package:flutter/material.dart';
import 'package:weather_app/utilities/Constants.dart';

class details extends StatelessWidget {
  IconData icon;
  String type;
  String value;
  details({required this.icon, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40.0,
        ),
        Text(
          '$value',
          style: detailText,
        ),
        Text(
          type,
          style: detailText,
        ),
      ],
    );
  }
}
