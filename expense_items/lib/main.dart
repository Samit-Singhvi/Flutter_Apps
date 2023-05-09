import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './expenses.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);

  runApp(MaterialApp(
    darkTheme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      // scaffoldBackgroundColor: kColorScheme.onPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      )),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 22,
          )),
    ),
    themeMode: ThemeMode.system,
    home: Scaffold(
      body: Expenses(),
    ),
  ));
}
