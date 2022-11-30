package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.server.ResponseStatusException;
import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import java.util.List;
import java.util.UUID;

@Service
public class MachineService {

    @Autowired
    private MachineRepository repository;

    private ZoneService zoneService;

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

    public List<ZoneModel> addZoneToMachine(List<ZoneModel> zoneToAdd, UUID machineId){
        if(repository.existsById(machineId)){
            MachineModel machine = repository.findById(machineId).get();
            if(existZoneInMachine(zoneToAdd, machine)){
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: some zone already exist");
            }
            if(machine.getZone().addAll(zoneToAdd)){
                for (ZoneModel zone : zoneToAdd){
                    if(!zoneService.existById(zone.getId())){
                        zoneService.addZone(zone);
                    } else {
                        zoneService.updateZone(zone);
                    }
                }
                repository.save(machine);
                return zoneToAdd;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone already exists");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    public List<ZoneModel> removeZoneFromMachine(List<ZoneModel> zoneToRemove, UUID machineId){
        if(repository.existsById(machineId)){
            MachineModel machine = repository.findById(machineId).get();
            if (machine.getZone().removeAll(zoneToRemove)){
                for ( ZoneModel zone : zoneToRemove){
                    if(zoneService.existById(zone.getId())){
                        zoneService.deleteZone(zone);
                    } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
                }
                repository.save(machine);
                return zoneToRemove;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    public List<ZoneModel> updateZoneInMachine(List<ZoneModel> zoneToUpdate, UUID machineId) {
        if (repository.existsById(machineId)) {
            MachineModel machine = repository.findById(machineId).get();
            if (machine.getZone().isEmpty()) {
                for (ZoneModel zone : zoneToUpdate) {
                    if (zoneService.existById(zone.getId())) {
                        zoneService.updateZone(zone);
                    } else
                        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
                }
                repository.save(machine);
                return zoneToUpdate;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    private boolean existZoneInMachine(List<ZoneModel> zone, MachineModel machine){
        return machine.getZone().containsAll(zone);
    }
}
