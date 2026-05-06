import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  final String text;
  final Animation<double> fade;
  final Animation<double> scale;
  final Animation<Offset> slide;
  final Animation<double>? rotation;

  const HelloText({
    super.key,
    required this.text,
    required this.fade,
    required this.scale,
    required this.slide,
    this.rotation,
  });

  /// Factory constructor para criar HelloText com animação de giro
  factory HelloText.animated({
    required Key key,
    required String text,
    required Animation<double> fade,
    required Animation<double> scale,
    required Animation<Offset> slide,
    required Animation<double> rotation,
  }) {
    return HelloText(
      key: key,
      text: text,
      fade: fade,
      scale: scale,
      slide: slide,
      rotation: rotation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: ScaleTransition(
          scale: scale,
          child: rotation != null
              ? AnimatedBuilder(
                  animation: rotation!,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspectiva
                        ..rotateY(
                          rotation!.value,
                        ), // Rotação horizontal (eixo Y)
                      child: _buildText(),
                    );
                  },
                )
              : _buildText(),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
