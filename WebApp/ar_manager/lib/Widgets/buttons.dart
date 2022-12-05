import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color fontColor;
  final FontWeight fontWeight;
  final double fontSize;

  const GenericButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontColor,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          boxShadow: <BoxShadow>[
            BoxShadow(color: color, offset: Offset.zero, blurRadius: 20)
          ],
          border: Border.all(color: const Color.fromARGB(255, 214, 225, 255)),
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((states) => color)),
        onPressed: () {},
        child: RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: fontColor,
                letterSpacing: -1,
                shadows: <Shadow>[
                  Shadow(color: color, offset: Offset.zero, blurRadius: 20)
                ]),
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
