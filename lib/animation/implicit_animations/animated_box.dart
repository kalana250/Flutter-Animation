import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBoxDemo extends StatefulWidget {
  const AnimatedBoxDemo({super.key});

  @override
  State<AnimatedBoxDemo> createState() => _AnimatedBoxDemoState();
}

class _AnimatedBoxDemoState extends State<AnimatedBoxDemo> {
  //Random number generator for randon properties
  final Random _random = Random();
  bool _isExpanded = false;

  //Initial properties
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.red;
  double _boarderRadius = 0.0;
  Alignment _alignment = Alignment.center;

  //Method to toggle the box state
  void _toggleBox() {
    setState(() {
      _isExpanded = !_isExpanded;
      _width = !_isExpanded ? 200 : 100;
      _height = !_isExpanded ? 200 : 100;
      _color = !_isExpanded ? Colors.blue : Colors.red;
      _boarderRadius = !_isExpanded ? 50 : 0;
      _alignment = !_isExpanded ? Alignment.bottomRight : Alignment.topLeft;
    });
  }

  //Method to randomize properties
  void _randomizeProperties() {
    setState(() {
      _width = 100.0 + _random.nextInt(200);
      _height = 100.0 + _random.nextInt(200);
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
      _boarderRadius = _random.nextDouble() * 100;
      _alignment = Alignment(
        _random.nextDouble() * 2 - 1,
        _random.nextDouble() * 2 - 1,
      );
    });
  }

  //Method to reset properties
  void _resetProperties() {
    setState(() {
      _width = 100.0;
      _height = 100.0;
      _color = Colors.red;
      _boarderRadius = 0.0;
      _alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _toggleBox,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_boarderRadius),
              color: _color,
            ),
            alignment: _alignment,
            duration: Duration(milliseconds: 500),
            child: FlutterLogo(size: 50),
          ),
        ),

        SizedBox(height: 20),

        ElevatedButton(
          onPressed: _randomizeProperties,
          child: Text("Random Properties"),
        ),

        SizedBox(height: 20),

        ElevatedButton(
          onPressed: _resetProperties,
          child: Text("Reset Properties"),
        ),
      ],
    );
  }
}
