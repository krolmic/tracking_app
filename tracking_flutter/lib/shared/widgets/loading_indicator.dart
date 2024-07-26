import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      strokeCap: StrokeCap.round,
    );
  }
}

class TinyLoadingIndicator extends StatelessWidget {
  const TinyLoadingIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: LoadingIndicator(
        color: color,
      ),
    );
  }
}
