import 'package:flutter/material.dart';
import 'package:sandbox_practice_flutter/animations/implicit/smooth_loading_indicator.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0;

  void _incrementProgress() {
    setState(() {
      if (_progress >= 1) {
        _progress = 0;
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current progress $_progress',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: _progress > 0,
                      child: const Text('Standard Loading Indicator'),
                    ),
                    const SizedBox(height: 10),
                    CircularProgressIndicator(
                      color: Colors.blue,
                      value: _progress,
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(children: [
                  Visibility(
                    visible: _progress > 0,
                    child: const Text('Smooth Loading Indicator'),
                  ),
                  const SizedBox(height: 10),
                  SmoothLoadingIndicator(
                    color: Colors.green,
                    progress: _progress,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementProgress,
              child: const Text('Increment Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
