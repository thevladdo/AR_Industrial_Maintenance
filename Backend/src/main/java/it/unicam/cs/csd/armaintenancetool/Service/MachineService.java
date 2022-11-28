package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import it.unicam.cs.csd.armaintenancetool.Repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.server.ResponseStatusException;
import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.UUID;

@Service
public class MachineService {

    @Autowired
    private MachineRepository repository;

    public MachineModel addMachine(MachineModel machine){
        if(repository.findById(machine.getId()).isPresent()){
            return repository.insert(machine);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid machine: this machine already exists");
    }

    public MachineModel deleteMachine(MachineModel machine){
        if(repository.findById(machine.getId()).isPresent()){
            repository.delete(machine);
            return machine;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid machine: this machine doesn't exist");
    }

    public MachineModel updateMachine(MachineModel machine){
        if (repository.findById(machine.getId()).isPresent()) {
            MachineModel old = repository.findById(machine.getId()).get();
            return repository.save(machine);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    public List<ZoneModel> addZoneToMachine(List<ZoneModel> newZone, UUID machineId){
        if(repository.existsById(machineId)){
            MachineModel machine = repository.findById(machineId).get();
            //TODO: check if newZone is ALREADY in machine
            if(machine.getZone().addAll(newZone)){
                repository.save(machine);
                return newZone;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone already exists");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    public List<ZoneModel> removeZoneFromMachine(List<ZoneModel> zoneToRemove, UUID machineId){
        if(repository.existsById(machineId)){
            MachineModel machine = repository.findById(machineId).get();
            if (machine.getZone().removeAll(zoneToRemove)){
                repository.save(machine);
                return zoneToRemove;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }
}
