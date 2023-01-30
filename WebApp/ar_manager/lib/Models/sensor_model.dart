import 'zone_model.dart';

enum TypeOfSensor<String> {
  temperature,
  humidity,
  pression,
}

class SensorModel {
  Map<TypeOfSensor, bool> type;
  ZoneModel zone;
  String id;

  get getType => type;

  set setType(type) => this.type = type;

  get get => zone;

  set set(zone) => this.zone = zone;

  get getId => id;

  set setId(id) => this.id = id;

  SensorModel(this.type, this.zone, this.id);
 

  factory SensorModel.fromJson(Map<String, dynamic> json) => 
   SensorModel(
    json["type"],
    json["id"],
    json["zone"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "zone": zone,
  };
}
