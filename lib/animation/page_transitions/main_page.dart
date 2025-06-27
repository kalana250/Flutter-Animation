import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/page_transitions/custum_page_transition.dart';
import 'package:flutter_animation/animation/page_transitions/sub_page.dart';

class SplashAnimationMainPage extends StatefulWidget {
  const SplashAnimationMainPage({super.key});

  @override
  State<SplashAnimationMainPage> createState() =>
      _SplashAnimationMainPageState();
}

class _SplashAnimationMainPageState extends State<SplashAnimationMainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(
          context,
        ).push(MyCustomRouteTransition(route: const SubPage()));

        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
