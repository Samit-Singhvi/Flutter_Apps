import 'package:flutter/material.dart';

class MealsDataScreen extends StatelessWidget {
  MealsDataScreen({super.key, required this.label, required this.icon});

  String label;
  IconData icon;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
