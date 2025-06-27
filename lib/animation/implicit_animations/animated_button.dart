// purchase_button.dart

import 'package:flutter/material.dart';

class AnimatedButtonExample extends StatefulWidget {
  @override
  _AnimatedButtonExampleState createState() => _AnimatedButtonExampleState();
}

class _AnimatedButtonExampleState extends State<AnimatedButtonExample> {
  bool _isPurchased = false;

  void _togglePurchase() {
    setState(() {
      _isPurchased = !_isPurchased;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePurchase,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: _isPurchased ? 150.0 : 200.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: _isPurchased ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: _isPurchased
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Thanks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.check, color: Colors.white, size: 30),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Purchase',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.monetization_on, color: Colors.white, size: 30),
                ],
              ),
      ),
    );
  }
}
