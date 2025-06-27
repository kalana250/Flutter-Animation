import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String item;
  final int index;
  const GridItem({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: "item_$index",
          flightShuttleBuilder: _flightShutterBuilder,
          child: Card(
            elevation: 2,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _flightShutterBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double rotation = flightDirection == HeroFlightDirection.push
            ? animation.value * 3.14
            : (1 - animation.value) * 3.14;

        return Transform(
          transform: Matrix4.identity()..rotateY(rotation),
          alignment: Alignment.center,
          child: toHeroContext.widget,
        );
      },
    );
  }
}
