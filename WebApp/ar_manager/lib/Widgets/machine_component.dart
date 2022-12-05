import 'package:animated_button/animated_button.dart';
import 'package:ar_manager/Screens/zone_view.dart';
import 'package:flutter/material.dart';

class MachineComponent extends StatefulWidget {
  const MachineComponent({super.key});

  @override
  State<MachineComponent> createState() => _MachineComponent();
}

class _MachineComponent extends State<MachineComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 50),
      padding: const EdgeInsets.only(left: 50, right: 50, top: 35, bottom: 35),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ID:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "ROOM:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "STATUS:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "MACHINE_1D_PLACEHOLDER",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "MACHINE_R00M_PLACEHOLDER",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "MACHINE_STATUS_PLACEHOLDER",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              AnimatedButton(
                color: const Color.fromARGB(255, 46, 46, 46),
                height: 45,
                width: 100,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ZoneHomePage()),
                  );
                },
                child: const Text(
                  'OPEN',
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
              const SizedBox(width: 30),
              AnimatedButton(
                color: const Color.fromARGB(255, 255, 191, 0),
                height: 45,
                width: 100,
                onPressed: () {},
                child: const Text(
                  'EDIT',
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
              const SizedBox(width: 30),
              AnimatedButton(
                color: const Color.fromARGB(255, 244, 89, 82),
                height: 45,
                width: 100,
                onPressed: () {},
                child: const Text(
                  'DELETE',
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
            ],
          )
        ],
      ),
    );
  }
}
