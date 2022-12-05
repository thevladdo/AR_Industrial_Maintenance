import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import '../Widgets/title.dart';
import '../Widgets/zone_component.dart';

class ZoneHomePage extends StatefulWidget {
  const ZoneHomePage({super.key});

  @override
  State<ZoneHomePage> createState() => _ZoneHomePage();
}

class _ZoneHomePage extends State<ZoneHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const MachineTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FractionallySizedBox(
              widthFactor: 1,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80, bottom: 20),
                    child: RichText(
                      text: const TextSpan(
                        text: 'SELECTED MACHINE:',
                        style: TextStyle(
                          fontFamily: 'SFMono',
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' SELECTED_MACHINE_1D_PLACEHOLDER',
                            style: TextStyle(
                              fontFamily: 'SFMono',
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: AnimatedButton(
                      color: const Color.fromARGB(255, 46, 46, 46),
                      height: 45,
                      width: 180,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CHANGE MACHINE',
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
              ),
            ),
            const ZoneComponent(),
            const ZoneComponent(),
            const ZoneComponent(),
            const ZoneComponent(),
            const ZoneComponent(),
            const ZoneComponent(),
            const ZoneComponent(),
          ],
        ),
      ),
    );
  }
}
