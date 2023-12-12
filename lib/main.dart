import 'package:flutter/material.dart';
import 'package:second/UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 150, 195, 231)),
        useMaterial3: true,
      ),
      //loading homepage of our app
      home: HomePage(),
    );
  }
}
