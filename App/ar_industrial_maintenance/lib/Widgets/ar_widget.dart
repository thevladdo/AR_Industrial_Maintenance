import 'package:flutter/material.dart';

// Usage: ArWidget(name: "name", value: "value", unit: "unit")
class ArWidget extends StatefulWidget {
  const ArWidget({
    super.key,
    required this.name,
    required this.value,
    required this.unit,
  });

  final String name;
  final String value;
  final String unit;

  @override
  State<ArWidget> createState() => _ArWidgetState();
}

class _ArWidgetState extends State<ArWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.white.withOpacity(0.4),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 2,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            child: RichText(
              text: TextSpan(
                text: "${widget.name.toUpperCase()}: ",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "SFMono",
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " ${widget.value}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "SFMono",
                    ),
                  ),
                  TextSpan(
                    text: " ${widget.unit}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "SFMono",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
