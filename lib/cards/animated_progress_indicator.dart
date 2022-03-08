

import 'package:flutter/material.dart';

import '../animations/implicit/smooth_loading_indicator.dart';
import '../animations/implicit/smooth_text_progress.dart';

class AnimatedProgressIndicatorCard extends StatelessWidget {
  const AnimatedProgressIndicatorCard(
      {Key? key, required this.progress, required this.incrementProgress})
      : super(key: key);

  final double progress;
  final VoidCallback incrementProgress;
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
            Text('Standard & Smooth Loading Indicator',
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: progress > 0,
                      child: Text('Standard ${progress.toStringAsFixed(2)}'),
                    ),
                    const SizedBox(height: 10),
                    CircularProgressIndicator(
                      color: Colors.blue,
                      value: progress,
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Visibility(
                      visible: progress > 0,
                      child: SmoothTextProgress(progress: progress),
                    ),
                    const SizedBox(height: 10),
                    SmoothLoadingIndicator(
                      color: Colors.green,
                      progress: progress,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementProgress,
              child: const Text('Increment Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
