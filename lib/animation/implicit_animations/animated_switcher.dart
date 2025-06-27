import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _showFirst = true;

  void _toggleChild() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _toggleChild, child: Text('Toggle Child')),
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: _showFirst
              ? Container(
                  key: ValueKey(1),
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )
              : Container(
                  key: ValueKey(2),
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
        ),
      ],
    );
  }
}
