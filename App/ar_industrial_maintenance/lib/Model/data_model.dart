class DataModel {
  String id;
  String name;
  double value;
  double coordinateX;
  double coordinateY;
  String unit;

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

  DataModel.complete(this.id, this.name, this.coordinateX, this.coordinateY,
      this.unit, this.value);
}
