import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

// Usage: ArWidget(name: 'Temperature', value: '25', unit: '°C', alerts: true)
class ArWidget extends StatefulWidget {
  const ArWidget(
      {super.key,
      required this.name,
      required this.value,
      required this.unit,
      required this.alerts});

  final String name;
  final String value;
  final String unit;
  final bool alerts;

  @override
  State<ArWidget> createState() => _ArWidgetState();
}

class _ArWidgetState extends State<ArWidget> {
  bool showAlert = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 200),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.9),
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 2,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  text: "${widget.name.toUpperCase()}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 74, 10, 10),
                    fontSize: 20,
                    fontFamily: "SFMono",
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " ${widget.value}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 239, 59, 83),
                        fontSize: 18,
                        fontFamily: "SFMono",
                      ),
                    ),
                    TextSpan(
                      text: " ${widget.unit}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 239, 59, 83),
                        fontSize: 18,
                        fontFamily: "SFMono",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (showAlert)
              Container(
                constraints: const BoxConstraints(minWidth: 200),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 239, 59, 83).withOpacity(0.5),
                      const Color.fromARGB(255, 239, 59, 83).withOpacity(0.9),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    width: 2,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: RichText(
                  text: const TextSpan(
                    text: "STAY SAFE !\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontFamily: "SFMono",
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "CO2 levels are high. Please open the windows and doors to let fresh air in.",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontFamily: "SFMono",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (widget.alerts)
              AnimatedButton(
                color: const Color.fromARGB(255, 239, 59, 83),
                height: 60,
                width: 60,
                onPressed: () {
                  setState(() {
                    showAlert = !showAlert;
                  });
                },
                child: showAlert
                    ? const Icon(
                        IconData(0xf82e, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 40,
                      )
                    : const Icon(
                        IconData(
                          0xe04a,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: Colors.white,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
