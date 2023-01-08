import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class ZoneComponent extends StatefulWidget {
  const ZoneComponent({super.key});

  @override
  State<ZoneComponent> createState() => _ZoneComponent();
}

class _ZoneComponent extends State<ZoneComponent> {
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
              const SizedBox(
                height: 100,
                child: Image(
                    image: AssetImage('../assets/images/qr.png'),
                    fit: BoxFit.cover),
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ID:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "STATUS:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "POSITION:",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ZONE_1D_PLACEHOLDER",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "ZONE_STATUS_PLACEHOLDER",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "ZONE_P0SITI0N_PLACEHOLDER",
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
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "QR ",
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
                      WidgetSpan(
                        child: Icon(
                          Icons.download_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
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
