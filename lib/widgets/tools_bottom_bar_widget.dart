import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/providers/bottom_bar_provider.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';

class ToolsBottomBarWidget extends StatelessWidget {
  const ToolsBottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Consumer<BottomBarProvider>(
            builder: (context, value, child) => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemButton(
                  imageUrl: 'assets/icons/line.png',
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.blackColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                ToolItemButton(
                  imageUrl: 'assets/icons/image.png',
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.blackColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                ToolItemButton(
                  imageUrl: 'assets/icons/shape.png',
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.blackColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                ToolItemButton(
                  imageUrl: 'assets/icons/attachment.png',
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.blackColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                ToolItemButton(
                  imageUrl: 'assets/icons/add.png',
                  backgroundColor: AppColors.blackColor,
                  foregroundColor: AppColors.primaryColor,
                  padding: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ToolItemButton extends StatelessWidget {
  ToolItemButton(
      {super.key,
      required this.imageUrl,
      required this.foregroundColor,
      required this.backgroundColor,
      this.padding});

  final String imageUrl;
  final Color foregroundColor;
  final Color backgroundColor;
  double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(padding ?? 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor.withOpacity(0.8)),
        child: Image.asset(
          imageUrl,
          color: foregroundColor,
          height: 25,
        ),
      ),
    );
  }
}
