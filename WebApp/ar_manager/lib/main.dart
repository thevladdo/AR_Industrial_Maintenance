import 'package:ar_manager/Screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loccioni | AR Manager',
      theme: ThemeData(fontFamily: 'SFMono'),
      home: const MachineHomePage(),
    );
  }
}
