import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class MoodsShaderMask extends StatelessWidget {
  const MoodsShaderMask({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
            primarySwatch,
          ],
          stops: [0.0, 0.95, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
