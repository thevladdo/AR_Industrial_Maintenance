package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.ZoneRepository;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;

import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.Optional;
import java.util.UUID;


@Service
public class ZoneService {

    @Autowired
    private ZoneRepository repository;


    public ZoneModel addZone(ZoneModel zone){
        zone.setId(new ZoneId(zone.getMachineId(), UUID.randomUUID()));
        return repository.insert(zone);
    }

    public ZoneModel deleteZone(ZoneModel zone){
        if(repository.existsById(zone.getId())){
            repository.delete(zone);
            return zone;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    }

    public ZoneModel updateZone(ZoneModel zone){
        if (repository.findById(zone.getId()).isPresent()) {
            return repository.save(zone);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public ZoneModel getZone(ZoneId id){
        if (repository.existsById(id)){
            Optional<ZoneModel> optional= repository.findById(id);
            return optional.get();
        }
         else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public List<ZoneModel> getZoneByMachine(UUID machineId){
        return repository.findByMachineId(machineId);
    }

}
