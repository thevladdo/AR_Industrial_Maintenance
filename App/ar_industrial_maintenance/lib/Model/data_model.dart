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

  DataModel(this.id, this.name, this.coordinateX, this.coordinateY,
      this.unit, this.value);

factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
  json["id"],
  json["name"],
  json["coordinateX"],
  json["coordinateY"],
  json["unit"],
  json["value"],
  );

Map<String, dynamic> toJson() => {
  "id" : id,
  "name" : name,
  "coordinateX" : coordinateX,
  "coordinateY" : coordinateY,
  "unit" : unit,
  "value" : value,
   };

}
