import './ZoneId.dart';

class ZoneModel {
 
  ZoneId id;// ZoneId('', ''); 
  String name;  
  String machineId; 

  ZoneModel(this.id, this.name, this.machineId);
  
  get getId => this.id;

  set setId( id) => this.id = id;

  get getName => this.name;

  set setName( name) => this.name = name;

  get getMachineId => this.machineId;

  set setMachineId( machineId) => this.machineId = machineId;

}

