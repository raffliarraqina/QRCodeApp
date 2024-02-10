import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 227),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                'Home of\nQR Code',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  color: Color.fromARGB(255, 18, 170, 170),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/generate");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 239, 227),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromARGB(255, 18, 170, 170))),
                      width: 200,
                      height: 60,
                      child: Center(
                        child: Text(
                          'QR Generator',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 18, 170, 170)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/scan");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 239, 227),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromARGB(255, 18, 170, 170))),
                      width: 200,
                      height: 60,
                      child: Center(
                        child: Text(
                          'QR Scanner',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 18, 170, 170)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}