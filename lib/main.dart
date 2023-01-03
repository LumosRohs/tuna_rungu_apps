import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tuna Rungu Apps',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFCA6027),
          secondary: const Color(0xFFF48143),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
