import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCodePage extends StatefulWidget {
  const GenerateCodePage({super.key});

  @override
  State<GenerateCodePage> createState() => _GenerateCodePageState();
}

class _GenerateCodePageState extends State<GenerateCodePage> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 227),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 239, 227),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 18, 170, 170)),
        title: Center(
          child: const Text('Generate QR Code',
              style: TextStyle(fontFamily: 'Poppins', color: Color.fromARGB(255, 18, 170, 170), fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/scan");
            },
            icon: const Icon(
              Icons.qr_code_scanner,
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 170, right: 40, left: 40, bottom: 170),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromARGB(255, 18, 170, 170))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, bottom: 18),
                      child: TextField(
                        style: const TextStyle(fontFamily: 'Poppins', color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                width: 2.5, color: Color.fromARGB(255, 18, 170, 170)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                width: 2.5, color: Color.fromARGB(255, 18, 170, 170)),
                          ),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            qrData = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                      ),
                      child: Column(children: [
                        if (qrData != null) PrettyQrView.data(data: qrData!)
                      ]),
                    )
                  ],
                ),
              ),
            ),
            //
          ),
        ),
      ),
    );
  }
}
