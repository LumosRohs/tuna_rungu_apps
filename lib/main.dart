import 'package:flutter/material.dart';
import 'package:tuna_rungu_apps/pages/hurufangka.dart';
import 'package:tuna_rungu_apps/pages/login.dart';
import 'package:tuna_rungu_apps/pages/video.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          primary: const Color(0xFFF5A21D),
          secondary: const Color(0xFFFFF4D2),
        ),
      ),
      home: const HurufAngkaPage(),
    );
  }
}
