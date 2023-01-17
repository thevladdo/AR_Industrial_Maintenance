import 'package:flutter/material.dart';
import '../Models/zone_id_model.dart';
import '../Models/data_model.dart';
import '../Models/sensor_model.dart';
import '../Models/zone_model.dart';
import '../Widgets/add_page_title.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  final _data = DataModel('', 0, 0, '', sensor1);

  static SensorModel sensor1 = SensorModel({
    TypeOfSensor.humidity: true,
    TypeOfSensor.pression: false,
    TypeOfSensor.temperature: true
  }, ZoneModel(ZoneId('001', '2'), 'Zone2', '2'),
      '${TypeOfSensor.humidity.name}005');

  static SensorModel sensor2 = SensorModel({
    TypeOfSensor.humidity: false,
    TypeOfSensor.pression: true,
    TypeOfSensor.temperature: false
  }, ZoneModel(ZoneId('004', '7'), 'Zone3', '7'),
      '${TypeOfSensor.humidity.name}090');

  static List<SensorModel> sensorList = [sensor1, sensor2];
  SensorModel dropdownValue = sensorList.first;

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
                    'ADD A NEW DATA',
                    style: TextStyle(
                      fontFamily: 'SFMono',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Field(
                      label: 'NAME TO IDENTIFY THE TYPE OF DATA',
                      onSaved: (val) => _data.setName = val!),
                  const SizedBox(height: 30),
                  Field(
                    label: 'COORDINATE X OF THE DATA',
                    onSaved: (value) =>
                        _data.setCoordinateX = double.parse(value!),
                  ),
                  const SizedBox(height: 30),
                  Field(
                    label: 'COORDINATE Y OF THE DATA',
                    onSaved: (value) =>
                        _data.setCoordinateX = double.parse(value!),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<SensorModel>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 15, top: 15),
                      labelText: "CHOOSE SENSOR TYPE",
                      labelStyle: const TextStyle(
                          fontFamily: 'SFMono',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10), //
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                    // style:TextStyle(color: Colors.grey,),
                    items: sensorList.map(
                      (SensorModel value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.id),
                        );
                      },
                    ).toList(),
                    onChanged: (SensorModel? value) {
                      setState(
                        () {
                          _data.setSensor = value!;
                          dropdownValue = value;
                        },
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
  const Field({super.key, this.onSaved, required this.label});

  final onSaved;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 3, color: Colors.black),
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
      onSaved: onSaved,
    );
  }
}
