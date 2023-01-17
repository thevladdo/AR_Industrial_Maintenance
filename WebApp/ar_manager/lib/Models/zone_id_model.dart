class ZoneId {
  String machineId;
  String zoneNum;

  ZoneId(this.machineId, this.zoneNum);

  get getMachineId => machineId;

  set setMachineId(String machineId) => this.machineId = machineId;

  get getZoneNum => zoneNum;

  set setZoneNum(zoneNum) => this.zoneNum = zoneNum;
}
