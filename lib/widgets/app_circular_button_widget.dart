import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';

// ignore: must_be_immutable
class AppCircularButton extends StatelessWidget {
  AppCircularButton({
    super.key,
    required this.onDrawerToggle,
    required this.color,
    required this.imageUrl,
    this.opacity = 1.0,
  });

  double opacity;
  final Color color;
  final String imageUrl;
  final VoidCallback onDrawerToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDrawerToggle,
      child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.lightblackColor.withOpacity(opacity),
          ),
          child: Image.asset(
            imageUrl,
            color: color,
          )),
    );
  }
}
