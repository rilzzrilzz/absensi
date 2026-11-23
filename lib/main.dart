import 'package:flutter/material.dart';
import 'auth/login.dart';

void main() {
  runApp(const EhadirApp());
}

class EhadirApp extends StatelessWidget {
  const EhadirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-HADIR',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            const Color(0xFFF6F6F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}