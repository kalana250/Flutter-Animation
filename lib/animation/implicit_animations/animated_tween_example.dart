// animated_tween_example.dart

import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  @override
  _TweenAnimationBuilderExampleState createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 300),
              duration: const Duration(milliseconds: 500),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.yellow,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
