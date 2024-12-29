import 'package:flutter/material.dart';
import 'package:notes_app/configs/routes.dart';
import 'package:notes_app/providers/bottom_bar_provider.dart';
import 'package:notes_app/screens/drawing_board_screen.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: BottomBarProvider(0))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        routes: {
          Routes.homeScreen: (context) => HomeScreen(),
          Routes.drawingScreen: (context) => const DrawingBoardScreen(),
        },
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
