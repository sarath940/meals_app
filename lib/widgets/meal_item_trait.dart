import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icondata, required this.label});

  final String label;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
