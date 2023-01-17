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

  SensorModel(this.type, this.zone, this.id);

  get getType => type;

  set setType(type) => this.type = type;

  get get => zone;

  set set(zone) => this.zone = zone;

  get getId => id;

  set setId(id) => this.id = id;
}
