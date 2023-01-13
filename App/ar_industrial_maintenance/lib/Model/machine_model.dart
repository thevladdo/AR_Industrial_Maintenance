class MachineModel {
  String id;
  String name;
  String description;
  String status;
  String timestamp;

  MachineModel(
      this.id, this.name, this.description, this.status, this.timestamp);

  String get getId => id;

  set setId(String id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getStatus => status;

  set setStatus(status) => this.status = status;

  get getTimestamp => timestamp;

  set setTimestamp(timestamp) => this.timestamp = timestamp;
}
