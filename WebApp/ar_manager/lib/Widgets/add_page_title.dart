import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'images.dart';

class AddPageTitle extends StatelessWidget {
  const AddPageTitle(
      {super.key,
      required this.saveRoute,
      this.formKey,
      this.pageContext,
      this.backRoute});

  final String saveRoute;
  final formKey;
  final pageContext;
  final backRoute;

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
                onPressed: () {
                  _onPressedSave(formKey, pageContext);
                },
                child: const Text(
                  'SAVE',
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
                color: const Color.fromARGB(255, 175, 24, 43),
                height: 45,
                width: 100,
                onPressed: () {
                  context.go(backRoute);
                },
                child: const Text(
                  'BACK',
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

_onPressedSave(formKey, context) {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Processing Data'),
      ),
      //context.go(saveRoute);
    );
  }
}
