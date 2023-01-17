import 'package:ar_manager/Widgets/add_page_title.dart';
import 'package:flutter/material.dart';
import '../Models/machine_model.dart';

class AddMachine extends StatefulWidget {
  const AddMachine({Key? key}) : super(key: key);

  @override
  _AddMachineState createState() => _AddMachineState();
}

class _AddMachineState extends State<AddMachine> {
  final _formKey = GlobalKey<FormState>();
  final _machine = MachineModel('', '', false);
  String machineStatus = 'OFFLINE';
  Color statusColor = const Color.fromARGB(255, 244, 89, 82);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: AddPageTitle(
          saveRoute: '/home',
          formKey: _formKey,
          pageContext: context,
          backRoute: '/home',
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
                    'ADD A NEW MACHINE',
                    style: TextStyle(
                      fontFamily: 'SFMono',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Field(
                      label: 'INSERT THE MACHINE NAME HERE', machine: _machine),
                  const SizedBox(height: 20),
                  Field(
                      label: 'INSERT THE MACHINE ROOM HERE', machine: _machine),
                  const SizedBox(height: 30),
                  SwitchListTile(
                    activeColor: const Color.fromARGB(255, 103, 206, 103),
                    inactiveThumbColor: const Color.fromARGB(255, 244, 89, 82),
                    inactiveTrackColor: const Color.fromARGB(150, 244, 90, 82),
                    title: RichText(
                      text: TextSpan(
                        text: 'MACHINE STATUS: ',
                        style: const TextStyle(
                            fontFamily: 'SFMono',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: machineStatus,
                            style: TextStyle(
                              fontFamily: 'SFMono',
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    value: _machine.status,
                    onChanged: (value) {
                      machineStatus = value ? 'ONLINE' : 'OFFLINE';
                      statusColor = value
                          ? const Color.fromARGB(255, 103, 206, 103)
                          : const Color.fromARGB(255, 244, 89, 82);
                      setState(
                        () => _machine.setStatus = value,
                      );
                    },
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
  const Field({super.key, this.machine, required this.label});

  final machine;
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
      onSaved: (val) => machine.setName = val!,
    );
  }
}
