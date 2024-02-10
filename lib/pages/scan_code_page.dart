import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({super.key});

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 227),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 239, 227),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 18, 170, 170)),
        title: Center(
            child: const Text('Scan QR Code',
                style: TextStyle(fontFamily: 'Poppins', color: Color.fromARGB(255, 18, 170, 170), fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generate");
            },
            icon: const Icon(
              Icons.qr_code,
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromARGB(255, 18, 170, 170))),
        margin: EdgeInsets.only(top: 140.0, left: 40, right: 40, bottom: 140),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Scan QR Code Here',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 18, 170, 170)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 170, 170),
                    border: Border.all(color: Color.fromARGB(255, 18, 170, 170), width: 6.0),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 250,
                height: 350,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                      returnImage: true,
                    ),
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        print('Barcode Found ${barcode.rawValue}');
                      }
                      if (image != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  barcodes.first.rawValue ?? "",
                                ),
                                content: Image(
                                  image: MemoryImage(image),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
