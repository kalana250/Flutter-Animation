import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  @override
  _AnimatedPaddingWidgetState createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double _padding = 10.0;

  void _togglePadding() {
    setState(() {
      _padding = _padding == 10.0 ? 50.0 : 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _togglePadding,
          child: const Text('Toggle Padding'),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: const Duration(seconds: 1),
            child: Container(width: 100, height: 100, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
