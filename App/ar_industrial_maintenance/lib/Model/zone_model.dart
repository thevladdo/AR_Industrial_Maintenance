class ZoneModel {
  ZoneId id;
  String name;
  double value;
  String machineId;

  ZoneModel(this.id, this.name, this.value, this.machineId);

  ZoneId get getId => id;

  set setId(ZoneId id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getValue => value;

  set setValue(value) => this.value = value;

  get getMachineId => machineId;

  set setMachineId(machineId) => this.machineId = machineId;
}

class ZoneId {
  String machineId;
  String zoneNum;

  ZoneId(this.machineId, this.zoneNum);

  get getZoneNum => zoneNum;

  set setZoneNum(zoneNum) => this.zoneNum = zoneNum;
}
