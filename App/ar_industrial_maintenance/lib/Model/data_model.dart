class DataModel {
  String id;
  String name;
  double value;
  int coordinateX;
  int coordinateY;
  String unit;
  String timestamp;
  String sensor;
  String zoneId;

  String get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getValue => value;

  set setValue(value) => this.value = value;

  get getCoordinateX => coordinateX;

  set setCoordinateX(coordinateX) => this.coordinateX = coordinateX;

  get getCoordinateY => coordinateY;

  set setCoordinateY(coordinateY) => this.coordinateY = coordinateY;

  get getUnit => unit;

  set setUnit(unit) => this.unit = unit;

  get getTimestamp => timestamp;

  set setTimestamp(timestamp) => this.timestamp = timestamp;

  get getSensor => sensor;

  set setSensor(sensor) => this.sensor = sensor;

  get getZoneId => zoneId;

  set setZoneId(zoneId) => this.zoneId = zoneId;

  DataModel.complete(this.id, this.name, this.coordinateX, this.coordinateY,
      this.sensor, this.timestamp, this.unit, this.value, this.zoneId);
}
