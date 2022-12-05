import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class MachineTitle extends StatelessWidget {
  const MachineTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LoccioniLogo(),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: AnimatedButton(
                color: const Color.fromARGB(255, 103, 206, 103),
                height: 45,
                width: 100,
                onPressed: () {},
                child: const Text(
                  'ADD',
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
            const SizedBox(width: 30),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: AnimatedButton(
                color: const Color.fromARGB(255, 241, 241, 241),
                height: 45,
                width: 100,
                onPressed: () {},
                child: const Text(
                  'EXPORT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 175, 24, 43),
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
            const SizedBox(width: 30),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: AnimatedButton(
                color: const Color.fromARGB(255, 175, 24, 43),
                height: 45,
                width: 100,
                onPressed: () {},
                child: const Text(
                  'LOGIN',
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
            const SizedBox(width: 50),
          ],
        )
      ],
    );
  }
}
