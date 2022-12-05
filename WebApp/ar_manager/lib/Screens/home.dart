import 'package:flutter/material.dart';
import '../Widgets/machine_component.dart';
import '../Widgets/title.dart';

class MachineHomePage extends StatefulWidget {
  const MachineHomePage({super.key});

  @override
  State<MachineHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MachineHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
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
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 50),
                child: const Text(
                  'SELECT A MACHINE TO SEE DETAILS',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
            const MachineComponent(),
          ],
        ),
      ),
    );
  }
}
