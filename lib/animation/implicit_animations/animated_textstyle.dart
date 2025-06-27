// animated_text_style_widget.dart

import 'package:flutter/material.dart';

class AnimatedTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedTextStyleWidgetState createState() =>
      _AnimatedTextStyleWidgetState();
}

class _AnimatedTextStyleWidgetState extends State<AnimatedTextStyleWidget> {
  bool _isStyled = false;

  void _toggleTextStyle() {
    setState(() {
      _isStyled = !_isStyled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          style: _isStyled
              ? const TextStyle(
                  fontSize: 30.0,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
          duration: const Duration(milliseconds: 500),
          child: const Text('Animated Text'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleTextStyle,
          child: const Text('Toggle Text Style'),
        ),
      ],
    );
  }
}
