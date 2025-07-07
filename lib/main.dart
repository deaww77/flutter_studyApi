import 'package:flutter/material.dart';
import 'package:flutter_api/attractions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 232, 152, 247),
          foregroundColor: const Color.fromARGB(255, 38, 117, 41),
        ),
      ),
      home: const AttractionsScreen(),
    );
  }
}
