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

  Curve _getRandomCurve() {
    final curves = [
      Curves.elasticOut,
      Curves.elasticInOut,
      Curves.bounceOut,
      Curves.bounceInOut,
      Curves.easeOutBack,
      Curves.easeOutExpo,
      Curves.easeOutCirc,
      Curves.fastOutSlowIn,
      Curves.easeInOutBack,
      Curves.decelerate,
    ];
    return curves[random.nextInt(curves.length)];
  }

  Animation<Offset> _createRandomSlideAnimation() {
    animationType = random.nextInt(8);
    final curve = _getRandomCurve();

    return switch (animationType) {
      slideUpAnimation => Tween(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideDownAnimation => Tween(
        begin: const Offset(0, -0.3),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideLeftAnimation => Tween(
        begin: const Offset(0.4, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideRightAnimation => Tween(
        begin: const Offset(-0.4, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideBottomLeftAnimation => Tween(
        begin: const Offset(0.35, -0.25),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideTopRightAnimation => Tween(
        begin: const Offset(-0.35, 0.25),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideTopLeftAnimation => Tween(
        begin: const Offset(0.35, 0.25),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      slideBottomRightAnimation => Tween(
        begin: const Offset(-0.35, -0.25),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
      _ => Tween(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve)),
    }.animate(controller);
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
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
      begin: 0.4,
      end: 1.5,
    ).chain(CurveTween(curve: Curves.elasticOut)).animate(controller);

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
