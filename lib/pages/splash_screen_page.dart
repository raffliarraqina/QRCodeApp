import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.popAndPushNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 227),
      body: Center(
        child: Text(
          'Home of\nQR Code',
          style: TextStyle(
              fontFamily: 'Poppins', color: Color.fromARGB(255, 18, 170, 170), fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
