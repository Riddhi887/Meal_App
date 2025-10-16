import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screen/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true, 
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 106, 46, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {

  //wrap the whole app with the ProviderScope so it allow the functionality of riverpod to be executed
  runApp(
    const  ProviderScope(
      child: App()
      )
      );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}