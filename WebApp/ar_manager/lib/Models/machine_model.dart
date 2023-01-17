class MachineModel {
  String id;
  String name;
  bool status;

  MachineModel(this.id, this.name, this.status);

  get getId => id;

  set setId(final id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getStatus => status;

  set setStatus(status) => this.status = status;
}
