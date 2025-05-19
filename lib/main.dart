import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const SplashPage(),
    );
  }
}
