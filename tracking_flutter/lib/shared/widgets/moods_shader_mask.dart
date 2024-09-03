import 'package:flutter/material.dart';
import 'package:tracking_app/shared/theme/colors.dart';

class MoodsShaderMask extends StatelessWidget {
  const MoodsShaderMask({
    required this.child,
    required this.begin,
    required this.end,
    required this.stops,
    super.key,
  });

  final Alignment begin;
  final Alignment end;
  final List<double> stops;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: begin,
          end: end,
          colors: const [
            Colors.transparent,
            Colors.transparent,
            AppColors.primarySwatch,
          ],
          stops: stops,
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
