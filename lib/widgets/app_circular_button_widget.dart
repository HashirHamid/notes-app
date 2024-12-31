import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';

// ignore: must_be_immutable
class AppCircularButton extends StatelessWidget {
  AppCircularButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.imageUrl,
    this.opacity = 1.0,
    this.padding,
  });

  double opacity;
  final Color color;
  final String imageUrl;
  final VoidCallback onTap;
  double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(padding ?? 2),
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
