import 'package:currency_converter_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        hintColor: Colors.white,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purpleAccent[200],
      ),
      home: HomePage(),
    );
  }
}
