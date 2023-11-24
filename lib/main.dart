
import 'package:flutter/material.dart';
import 'package:tugas_akhir_124210010/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizarding World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.black,
        canvasColor: Colors.black,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


