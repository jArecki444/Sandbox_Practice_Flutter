import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerCard extends StatefulWidget {
  const BarcodeScannerCard({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerCard> createState() => _BarcodeScannerCardState();
}

class _BarcodeScannerCardState extends State<BarcodeScannerCard> {
  String? _scanResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text('Barcode / QR scanner',
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 12),
              Visibility(
                  visible: _scanResult != null,
                  child: Text('Scan result: $_scanResult')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => scan(ScanMode.BARCODE),
                    child: const Text('Scan barcode'),
                  ),
                  ElevatedButton(
                    onPressed: () => scan(ScanMode.QR),
                    child: const Text('Start QR scan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scan(ScanMode scanMode) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, scanMode);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanResult = barcodeScanRes;
    });
  }
}
