import 'package:flutter/material.dart';

import 'gym.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner icon
      debugShowCheckedModeBanner: false,
      title: 'bmi',
      home: HomeScreen(),
    );
  }
}

