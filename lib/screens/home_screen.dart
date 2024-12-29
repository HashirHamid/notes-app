import 'package:flutter/material.dart';
import 'package:notes_app/configs/colors.dart';
import 'package:notes_app/providers/bottom_bar_provider.dart';
import 'package:notes_app/screens/favorites_screen.dart';
import 'package:notes_app/widgets/app_drawer_widget.dart';
import 'package:notes_app/widgets/bottom_bar_widget.dart';
import 'package:notes_app/widgets/notes_grid.dart';
import 'package:notes_app/widgets/top_app_bar_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const AppDrawer(),
      backgroundColor: AppColors.blackColor,
      floatingActionButton: const BottomBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              TopAppBar(onDrawerToggle: () {
                globalKey.currentState!.openDrawer();
              }),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Consumer<BottomBarProvider>(
                  builder: (context, value, child) => value.selectedIndex == 0
                      ? const NotesGrid()
                      : value.selectedIndex == 1
                          ? const FavoritesScreen()
                          : const FavoritesScreen(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
