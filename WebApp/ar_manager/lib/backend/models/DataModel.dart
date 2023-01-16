import './SensorModel.dart';

class DataModel{

String name;
double coordinateX;
double coordinateY;
String unit;
SensorModel sensor;
 String get getName => this.name;

 set setName(String name) => this.name = name;

 double get getCoordinateX => this.coordinateX;

 set setCoordinateX(double coordinateX) => this.coordinateX = coordinateX;

 double get getCoordinateY => this.coordinateY;

 set setCoordinateY(double coordinateY) => this.coordinateY = coordinateY;

 String get getUnit => this.unit;

 set setUnit(String unit) => this.unit = unit;

 SensorModel get getSensor => this.sensor;

 set setSensor(SensorModel sensor) => this.sensor = sensor;

DataModel(this.name,this.coordinateX,this.coordinateY,this.unit,this.sensor);

}