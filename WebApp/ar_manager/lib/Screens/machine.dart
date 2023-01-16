import 'package:flutter/material.dart';
import '../backend/models/MachineModel.dart';

class Machine extends StatefulWidget {

  const Machine({Key? key}) : super(key: key);

  @override 
  _MachineState createState() => _MachineState();
  
}
  class _MachineState extends State<Machine>{
    final _formKey = GlobalKey<FormState>();
    final _machine = MachineModel('','',false);
       
    @override
    Widget build(BuildContext context){
    return Scaffold (
      appBar: 
      AppBar(title: const Text('Machines',
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
                  decoration: const InputDecoration(labelText:'Name of the machine:'),
                  validator: (value) {
                    if (value == null || value.isEmpty){return 'Please enter a name.';} return null;
                  },
                  onSaved: (val) => _machine.setName = val!,
                ),

                SwitchListTile(
                  title: const Text('Status'),
                  value: _machine.status,
                  onChanged: (bool value) {
                    setState(() {_machine.setStatus= value;});
                  },
                  secondary: const Icon(Icons.power_settings_new),
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