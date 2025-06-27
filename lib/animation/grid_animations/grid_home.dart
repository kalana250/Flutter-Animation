import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/grid_animations/grid_item.dart';

class GridHome extends StatelessWidget {
  GridHome({super.key});

  final List<String> item = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: item.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return GridItem(item: item[index], index: index);
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                transitionDuration: Duration(seconds: 1),
              ),
            );
          },
          child: Hero(
            tag: "item_$index",
            flightShuttleBuilder: _flightShutterBuilder,
            child: Card(
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      item[index],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
