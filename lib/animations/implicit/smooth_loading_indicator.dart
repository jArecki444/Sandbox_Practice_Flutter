import 'package:flutter/material.dart';

class SmoothLoadingIndicator extends ImplicitlyAnimatedWidget {
  const SmoothLoadingIndicator({
    required this.progress,
    this.color = Colors.blue,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    Key? key,
  }) : super(duration: duration, curve: curve, key: key);

  final double progress;
  final Color color;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _SmoothLoadingIndicatorState();
  }
}

class _SmoothLoadingIndicatorState
    extends AnimatedWidgetBaseState<SmoothLoadingIndicator> {
  Tween<double?>? _progress;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: widget.color,
      value: _progress!.evaluate(animation),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progress = visitor(
      _progress,
      (widget.progress).clamp(0.0, 1.0),
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double?>?;
  }
}
