import './sensor_model.dart';

class DataModel {
  String name;
  double coordinateX;
  double coordinateY;
  String unit;
  SensorModel sensor;
  
  
  String get getName => name;

  set setName(String name) => this.name = name;

  double get getCoordinateX => coordinateX;

  set setCoordinateX(double coordinateX) => this.coordinateX = coordinateX;

  double get getCoordinateY => coordinateY;

  set setCoordinateY(double coordinateY) => this.coordinateY = coordinateY;

  String get getUnit => unit;

  set setUnit(String unit) => this.unit = unit;

  SensorModel get getSensor => sensor;

  set setSensor(SensorModel sensor) => this.sensor = sensor;



  DataModel(this.name, this.coordinateX, this.coordinateY, this.unit, this.sensor);

  
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      json["name"], 
      json["coordinateX"], 
      json["coordinateY"], 
      json["unit"], 
      json["sensor"],
  );
  
  
  Map<String, dynamic> toJson () => {
    "name" : name ,
    "coordinateX" : coordinateX ,
    "coordinateY" : coordinateY ,
    "unit" : unit ,
    "sensor" : sensor ,
  };
  
}
