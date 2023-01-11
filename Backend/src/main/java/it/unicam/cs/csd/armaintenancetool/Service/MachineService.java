package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.server.ResponseStatusException;
import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MachineService {

    @Autowired
    private MachineRepository repository;


    public MachineModel getMachine(UUID id){
        if (repository.existsById(id)){
            Optional<MachineModel> optional= repository.findById(id);
            return optional.get();
        }
         else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public List<MachineModel> findAll(){
        return repository.findAll();
    }

    public MachineModel addMachine(MachineModel machine){
        if(machine.getName()!=null){
            machine.setId(UUID.randomUUID());
            return repository.insert(machine);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid machine");
    }

    public boolean deleteMachine(UUID id){
        if(repository.existsById(id)){
            repository.deleteById(id);;
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid machine: this machine doesn't exist");
    }

    public MachineModel updateMachine(MachineModel machine){
        if (repository.findById(machine.getId()).isPresent()) {
            return repository.save(machine);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    }

    // public List<ZoneModel> addZoneToMachine(List<ZoneModel> zoneToAdd, UUID machineId){
    //     if(repository.existsById(machineId)){
    //         MachineModel machine = repository.findById(machineId).get();
    //         if(existZoneInMachine(zoneToAdd, machine)){
    //             throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: some zone already exist");
    //         }
    //         if(machine.getZone().addAll(zoneToAdd)){
    //             for (ZoneModel zone : zoneToAdd){
    //                 if(!zoneService.existById(zone.getId())){
    //                     zoneService.addZone(zone, machineId);
    //                 } else {
    //                     zoneService.updateZone(zone);
    //                 }
    //             }
    //             repository.save(machine);
    //             return zoneToAdd;
    //         } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone already exists");
    //     } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    // }

    // public List<ZoneModel> removeZoneFromMachine(List<ZoneModel> zoneToRemove, UUID machineId){
    //     if(repository.existsById(machineId)){
    //         MachineModel machine = repository.findById(machineId).get();
    //         if (machine.getZone().removeAll(zoneToRemove)){
    //             for ( ZoneModel zone : zoneToRemove){
    //                 if(zoneService.existById(zone.getId())){
    //                     zoneService.deleteZone(zone);
    //                 } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    //             }
    //             repository.save(machine);
    //             return zoneToRemove;
    //         } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    //     } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    // }

    // public List<ZoneModel> updateZoneInMachine(List<ZoneModel> zoneToUpdate, UUID machineId) {
    //     if (repository.existsById(machineId)) {
    //         MachineModel machine = repository.findById(machineId).get();
    //         if (machine.getZone().isEmpty()) {
    //             for (ZoneModel zone : zoneToUpdate) {
    //                 if (zoneService.existById(zone.getId())) {
    //                     zoneService.updateZone(zone);
    //                 } else
    //                     throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    //             }
    //             repository.save(machine);
    //             return zoneToUpdate;
    //         } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    //     } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected machine doesn't exist yet. Try to add it");
    // }
    // public List<ZoneModel> updateZoneInMachine(List<ZoneModel> zoneToUpdate, UUID machineId) {
    //     if (repository.existsById(machineId)) {
    //         MachineModel machine = repository.findById(machineId).get();
    //         ArrayList<ZoneModel.ZoneId> oldDataUuids = machine.getZone();
    //         ArrayList<UUID> newDataUuids  = new ArrayList<>();
            
    //         for (DataModel data : zoneToUpdate) {
    //             if(data.getId()!=null){
    //                 if (dataService.existById(data.getId())) {
    //                     dataService.updateData(data);
    //                 } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data doesn't exist");
    //             } else{
    //                 data.setId(dataService.addData(data).getId());
    //             }
    //             newDataUuids.add(data.getId());
    //         }
    //         oldDataUuids.removeAll(newDataUuids);
    //         dataService.deleteAll(oldDataUuids);
    //         machine.setData(newDataUuids);
            
    //         repository.save(machine);
    //         return zoneToUpdate;
            
    //     }else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    // }

    // private boolean existZoneInMachine(List<ZoneModel> zone, MachineModel machine){
    //     return machine.getZone().containsAll(zone);
    // }
}
