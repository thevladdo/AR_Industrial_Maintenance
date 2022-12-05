import 'package:flutter/material.dart';

// This is a widget that displays the Loccioni logo image.
class LoccioniLogo extends StatelessWidget {
  const LoccioniLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.only(top: 30, left: 50),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../../assets/images/loccioni_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
