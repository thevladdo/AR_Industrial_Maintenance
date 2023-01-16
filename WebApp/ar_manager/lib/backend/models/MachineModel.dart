class MachineModel {
  
  String id;
  String name;
  bool status;
  
  MachineModel (this.id, this.name, this.status);
 
 get getId => this.id;

 set setId(final id) => this.id = id;

  get getName => this.name;

 set setName( name) => this.name = name;

  get getStatus => this.status;

 set setStatus( status) => this.status = status;

 
}


