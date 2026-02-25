
import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  final String text;
  final Animation<double> fade;
  final Animation<double> scale;
  final Animation<Offset> slide;

  const HelloText({
    super.key,
    required this.text,
    required this.fade,
    required this.scale,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: ScaleTransition(
          scale: scale,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
