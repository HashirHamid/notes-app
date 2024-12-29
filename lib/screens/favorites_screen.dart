import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Favorites",
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
