import 'package:flutter/material.dart';
import 'package:sandbox_practice_flutter/animations/explicit/icon.dart';

class AnimatedIconsCard extends StatelessWidget {
  const AnimatedIconsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text('Animation Controller example',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 12),
            AnimatedRadiatingIcon(),
          ],
        ),
      ),
    );
  }
}
