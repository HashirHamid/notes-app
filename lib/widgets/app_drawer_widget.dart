import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        backgroundColor: AppColors.blackColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Notefy",
                style: TextStyle(
                    fontFamily: "Lemonade",
                    fontSize: 40,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
        ));
  }
}
