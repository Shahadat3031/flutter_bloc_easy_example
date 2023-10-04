import 'package:flutter/material.dart';
import 'package:flutter_bloc_easy_example/features/home/ui/home_view.dart';

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
            primaryColor: Colors.teal,
        ),
        home: const HomeScreen());
  }
}
