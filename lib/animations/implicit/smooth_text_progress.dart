import 'package:flutter/material.dart';

class SmoothTextProgress extends ImplicitlyAnimatedWidget {
  const SmoothTextProgress({
    required this.progress,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.easeOutCubic,
    Key? key,
  }) : super(duration: duration, curve: curve, key: key);

  final double progress;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _SmoothTextProgressState();
  }
}

class _SmoothTextProgressState
    extends AnimatedWidgetBaseState<SmoothTextProgress> {
  Tween<double?>? _progress;

  @override
  Widget build(BuildContext context) {
    final currentProgress = _progress?.evaluate(animation);
    print('currentProgress: $_progress');
    return Text(
        currentProgress != null ? 'Smooth ${currentProgress.toStringAsFixed(2)}' : '0');
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progress = visitor(
      _progress,
      widget.progress,
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double?>?;
  }
}
