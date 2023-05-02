import 'package:ecommerce/presentation/core/colors.dart';
import 'package:ecommerce/presentation/homepage/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: kBlack),
          titleMedium: TextStyle(color: kBlack),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
