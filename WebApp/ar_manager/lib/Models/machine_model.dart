class MachineModel {
  String id;
  String name;
  bool status;

  get getId => id;

  set setId(final id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getStatus => status;

  set setStatus(status) => this.status = status;

  
  MachineModel(this.id, this.name, this.status);

  factory MachineModel.fromJson(Map<String, dynamic> json) =>
  MachineModel(
    json["id"],
    json["name"],
    json["status"],
    );

    Map<String, dynamic> toJson() => {
      "id" : id,
      "name" : name,
      "status" : status,
    };

}
