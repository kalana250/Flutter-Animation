import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/grid_animations/grid_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Animations Example")),
        body: Center(child: GridHome()),
      ),
    );
  }
}

//1.34.44
