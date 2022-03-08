import 'package:flutter/material.dart';

class AnimatedRadiatingIcon extends StatefulWidget {
  const AnimatedRadiatingIcon({Key? key}) : super(key: key);

  @override
  _AnimatedRadiatingIconState createState() => _AnimatedRadiatingIconState();
}

class _AnimatedRadiatingIconState extends State<AnimatedRadiatingIcon>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          //print('animationController.value: ${animationController.value}');

          return Container(
            decoration: ShapeDecoration(
              color: Colors.blue.withOpacity(0.5),
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0 * animationController.value),
              child: child, //its the padding that is changing with time
            ),
          );
        },
        child: DecoratedBox(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {},
            color: Colors.blue,
            icon: const Icon(Icons.calendar_today, size: 24),
          ),
        ),
      ),
    );
  }
}
