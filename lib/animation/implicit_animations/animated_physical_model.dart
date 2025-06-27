import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModelWidgetState createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _isFlat = true;

  void _toggleElevation() {
    setState(() {
      _isFlat = !_isFlat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _toggleElevation,
          child: const Text('Toggle Elevation'),
        ),
        AnimatedPhysicalModel(
          duration: const Duration(seconds: 1),
          shape: BoxShape.rectangle,
          elevation: _isFlat ? 0 : 10.0,
          color: Colors.blue,
          shadowColor: Colors.black,
          child: const SizedBox(width: 100, height: 100),
        ),
      ],
    );
  }
}
