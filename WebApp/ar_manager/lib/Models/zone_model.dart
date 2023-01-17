import 'zone_id_model.dart';

class ZoneModel {
  ZoneId id; // ZoneId('', '');
  String name;
  String machineId;

  ZoneModel(this.id, this.name, this.machineId);

  get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getMachineId => machineId;

  set setMachineId(machineId) => this.machineId = machineId;
}
