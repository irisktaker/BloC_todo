import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoBloC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF000A1F),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF000A1F),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
