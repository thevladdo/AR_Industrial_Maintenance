import 'package:animated_button/animated_button.dart';
import 'package:ar_industrial_maintenance/Screens/qrview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterStartButton extends StatelessWidget {
  const FooterStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: AnimatedButton(
            color: const Color(0xffAF182B),
            height: 60,
            width: 220,
            onPressed: () {
              context.go('/scanqr');
            },
            child: const Text(
              'START SCANNING',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                      color: Color.fromARGB(255, 178, 185, 208),
                      offset: Offset.zero,
                      blurRadius: 20)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
