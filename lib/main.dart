import 'package:flutter/material.dart';
import 'package:sandbox_practice_flutter/cards/animated_icons.dart';
import 'package:sandbox_practice_flutter/cards/barcode_scanner.dart';
import 'package:sandbox_practice_flutter/cards/compare_photos_slider.dart';
import 'package:sandbox_practice_flutter/cards/counter/counter_page.dart';

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
      home: const MyHomePage(title: 'Sandbox Practice'),
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: const FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const BarcodeScannerCard(),
                  const ComparePhotosSliderCard(),
                  const CounterPageCard(),
                  AnimatedProgressIndicatorCard(
                    incrementProgress: _incrementProgress,
                    progress: _progress,
                  ),
                  const AnimatedIconsCard(),
                ],
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
