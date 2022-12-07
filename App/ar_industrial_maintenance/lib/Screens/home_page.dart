import 'package:ar_industrial_maintenance/Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Widgets/footer_start.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const AppTitle(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
              child: const Text(
                'Welcome in\n AR Industrial Maintenance',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: const Text(
                'Frame in QR code placed on area of interest to illustrate information',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const FooterStartButton(),
    );
  }
}
