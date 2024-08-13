import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/theme/sh_colors.dart';

class ParallaxImageCard extends StatelessWidget {
  const ParallaxImageCard({
    super.key,
    required this.imageUrl,
    this.parallaxValue = 0,
  });

  final String imageUrl;
  final double parallaxValue;

  BoxDecoration get _parallaxUrlImageDecoration => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: SHColors.hintColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(-7, 7),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
          alignment: Alignment(lerpDouble(0.5, -0.5, parallaxValue)!, 0),
        ),
      );

  BoxDecoration get _vignetteDecoration => const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: RadialGradient(
          radius: 2,
          colors: [Colors.transparent, Colors.black],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: _parallaxUrlImageDecoration),
        DecoratedBox(decoration: _vignetteDecoration),
      ],
    );
  }
}
