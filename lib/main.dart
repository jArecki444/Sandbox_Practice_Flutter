import 'package:flutter/material.dart';
import 'package:sandbox_practice_flutter/cards/animated_icons.dart';

import 'cards/animated_progress_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandbox Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sandbox Practice Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0.3;

  void _incrementProgress() {
    setState(() {
      if (_progress >= 1.0) {
        _progress = 0.0;
      } else {
        _progress = _progress + 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedProgressIndicatorCard(
              incrementProgress: _incrementProgress, progress: _progress),
          AnimatedIconsCard(),
        ],
      ),
    );
  }
}
