import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/providers/bottom_bar_provider.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
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
                GestureDetector(
                  onTap: () {
                    value.onChange(0);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor
                            .withOpacity(value.selectedIndex == 0 ? 0.8 : 0.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/home.png",
                          height: 25,
                        ),
                        const Text(
                          "Home",
                          style:
                              TextStyle(fontFamily: "Lemonade", fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    value.onChange(1);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor
                            .withOpacity(value.selectedIndex == 1 ? 0.8 : 0.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/heart.png",
                          height: 25,
                        ),
                        const Text(
                          "Favorites",
                          style:
                              TextStyle(fontFamily: "Lemonade", fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    value.onChange(2);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryColor
                          .withOpacity(value.selectedIndex == 2 ? 0.8 : 0.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/settings.png",
                          height: 25,
                        ),
                        const Text(
                          "Settings",
                          style:
                              TextStyle(fontFamily: "Lemonade", fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
