import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_category_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 97, 81, 218),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
