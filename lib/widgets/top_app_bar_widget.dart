import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';
import 'package:notes_app/widgets/app_circular_button_widget.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    required this.onDrawerToggle,
    super.key,
  });

  final VoidCallback onDrawerToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Notefy",
          style: TextStyle(
              fontFamily: "Lemonade",
              fontSize: 40,
              color: AppColors.primaryColor),
        ),
        AppCircularButton(
          onDrawerToggle: onDrawerToggle,
          color: AppColors.primaryColor,
          imageUrl: "assets/icons/options.png",
        )
      ],
    );
  }
}
