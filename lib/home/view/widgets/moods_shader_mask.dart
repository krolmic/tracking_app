part of '../home_screen.dart';

class _MoodsShaderMask extends StatelessWidget {
  const _MoodsShaderMask({
    required this.child,
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
