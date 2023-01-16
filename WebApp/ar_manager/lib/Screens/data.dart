import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../backend/models/ZoneId.dart';
import '../backend/models/DataModel.dart';
import '../backend/models/SensorModel.dart';
import '../backend/models/ZoneModel.dart';



class Data extends StatefulWidget {

  const Data({Key? key}) : super(key: key);
  
  @override 
  _DataState createState() => _DataState();
  
}
  class _DataState extends State<Data>{
    final _formKey = GlobalKey<FormState>();
    final _data = DataModel('',0,0,'',sensor1); 
    
    static SensorModel sensor1 = SensorModel( 
      {TypeOfSensor.humidity: true, TypeOfSensor.pression: false,TypeOfSensor.temperature: true},
       ZoneModel(ZoneId('001', '2'), 'Zone2', '2'), 
       TypeOfSensor.humidity.name +'005');
    static SensorModel sensor2 = SensorModel( 
      {TypeOfSensor.humidity: false, TypeOfSensor.pression: true,TypeOfSensor.temperature: false},
       ZoneModel(ZoneId('004', '7'), 'Zone3', '7'), 
       '${TypeOfSensor.humidity.name}090');
    static List<SensorModel> sensorList = [sensor1,sensor2];
    SensorModel dropdownValue = sensorList.first;


    @override
    Widget build(BuildContext context){
    return Scaffold (
      appBar: 
      AppBar(title: const Text('Data',
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w200,
        fontStyle:FontStyle.normal 
        )),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
            )
          )
      ),



      body:
      Container(
        padding:
          const EdgeInsets.symmetric(vertical:16.0 ,horizontal:16.0 ),
        
        child: Builder(
          builder: (context) => 
          Form(key: _formKey,child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                TextFormField(
                  decoration: const InputDecoration(labelText:'Name to identify the type of the data:'),
                  validator: (value) {
                    if (value == null || value.isEmpty){return 'Please enter a name.';}
                    return null;
                  },
                  onSaved: (val) => _data.setName= val!,
                ),
                       
                DropdownButton<SensorModel>(
                  hint: Text("Choose a sensor:"),
                  value: dropdownValue, 
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black, ),
                 // style:TextStyle(color: Colors.grey,),
                 
                  items: sensorList.map((SensorModel value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.id),
                    );
                  }).toList(),

                   onChanged: (SensorModel? value) {
                   setState(() {_data.setSensor = value!;
                   dropdownValue = value;});
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText:'Coordinate X, for the position of the data:'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                  validator:  (value) {
                    if (value == null || value.isEmpty){return 'Please enter a coordinate.';}
                    return null;
                  },
                  onSaved: (value) => _data.setCoordinateX= double.parse(value!)
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText:'Coordinate Y, for the position of the data:'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                  validator:  (value) {
                    if (value == null || value.isEmpty){return 'Please enter a coordinate.';}
                    return null;
                  },
                  onSaved: (value) => _data.setCoordinateY = double.parse(value!)
                ),
                

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: 

                    ElevatedButton (
                      onPressed:() {
                        final form = _formKey.currentState;
                        if(form!.validate()){
                          form.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));}},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Save',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w200,
                          fontStyle:FontStyle.normal 
                      )
                      ),
                    ),
                    ),
                
              
            ])))),
    );
    }
  }