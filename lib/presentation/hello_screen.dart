import 'dart:math';

import 'package:flutter/material.dart';

import '../core/hello_repository.dart';
import 'hello_text.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<double> scale;
  late Animation<Offset> slide;

  int index = 0;
  int backgroundIndex = 0;
  int animationType = 0;
  final Random random = Random();

  static const int slideUpAnimation = 0;
  static const int slideDownAnimation = 1;
  static const int slideLeftAnimation = 2;
  static const int slideRightAnimation = 3;
  static const int slideBottomLeftAnimation = 4;
  static const int slideTopRightAnimation = 5;
  static const int slideTopLeftAnimation = 6;
  static const int slideBottomRightAnimation = 7;

  int _getRandomBackgroundIndex() {
    int newIndex;
    do {
      newIndex = random.nextInt(HelloRepository.colors.length);
    } while (newIndex == index);
    return newIndex;
  }

  Animation<Offset> _createRandomSlideAnimation() {
    animationType = random.nextInt(8);

    return switch (animationType) {
      slideUpAnimation => Tween(
        begin: const Offset(0, 0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideDownAnimation => Tween(
        begin: const Offset(0, -0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideLeftAnimation => Tween(
        begin: const Offset(0.15, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideRightAnimation => Tween(
        begin: const Offset(-0.15, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideBottomLeftAnimation => Tween(
        begin: const Offset(0.12, -0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideTopRightAnimation => Tween(
        begin: const Offset(-0.12, 0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideTopLeftAnimation => Tween(
        begin: const Offset(0.12, 0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      slideBottomRightAnimation => Tween(
        begin: const Offset(-0.12, -0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
      _ => Tween(
        begin: const Offset(0, 0.1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut)),
    }.animate(controller);
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.forward(from: 0);
              setState(() {
                index = random.nextInt(HelloRepository.hellos.length);
                backgroundIndex = _getRandomBackgroundIndex();
                slide = _createRandomSlideAnimation();
              });
            }
          });

    fade = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 40,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 20),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 40,
      ),
    ]).animate(controller);

    scale = Tween(
      begin: 0.96,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeOut)).animate(controller);

    slide = _createRandomSlideAnimation();

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelloRepository.colors[backgroundIndex],
      body: Stack(
        children: <Widget>[
          Container(color: Colors.black.withAlpha(220)),
          Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return HelloText(
                  text: HelloRepository.hellos[index].label,
                  fade: fade,
                  scale: scale,
                  slide: slide,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
