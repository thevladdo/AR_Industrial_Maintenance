import 'package:flutter/material.dart';

import 'Screens/home_page.dart';

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
      title: 'Loccioni | AR Maintenance App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffAF182B),
        fontFamily: 'SFMono',
      ),
      home: const HomePage(),
    );
  }
}
