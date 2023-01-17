import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Models/zone_model.dart';
import '../Models/zone_id_model.dart';
import '../Widgets/add_page_title.dart';

class AddZone extends StatefulWidget {
  const AddZone({Key? key}) : super(key: key);

  @override
  _AddZoneState createState() => _AddZoneState();
}

class _AddZoneState extends State<AddZone> {
  final _formKey = GlobalKey<FormState>();
  final _zone = ZoneModel(ZoneId('', ''), '', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: AddPageTitle(
          saveRoute: '/machine',
          formKey: _formKey,
          pageContext: context,
          backRoute: '/machine',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 60, right: 60, bottom: 50, top: 50),
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 35, bottom: 35),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ADD A NEW ZONE',
                    style: TextStyle(
                      fontFamily: 'SFMono',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Field(label: 'INSERT THE ZONE NAME HERE', zone: _zone),
                  const SizedBox(height: 40),
                  AnimatedButton(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 50,
                    width: 130,
                    onPressed: () {
                      context.go('/add/data');
                    },
                    child: const Text(
                      'ADD DATA',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({super.key, this.zone, required this.label});

  final zone;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
        ),
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 175, 24, 43),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 175, 24, 43),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        labelStyle: const TextStyle(
            fontFamily: 'SFMono',
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.black),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
      onSaved: (val) => zone.setName = val!,
    );
  }
}
