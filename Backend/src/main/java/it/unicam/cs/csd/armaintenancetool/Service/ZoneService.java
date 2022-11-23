package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Repository.ZoneRepository;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ZoneService {

    @Autowired
    private ZoneRepository repository;


    public ZoneModel addZone(ZoneModel zone){
        if(repository.findById(zone.getId()).isPresent()){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone already exists");
        } return repository.insert(zone);
    }

    public ZoneModel deleteData(ZoneModel zone){
        if(repository.findById(zone.getId()).isPresent()){
            repository.delete(zone);
            return zone;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    }

    public ZoneModel updateData(ZoneModel zone){
        if (repository.findById(zone.getId()).isPresent()) {
            ZoneModel old = repository.findById(zone.getId()).get();
            return repository.save(zone);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public List<DataModel> addDataToZone(List<DataModel> dataToAdd, UUID zoneId){
        if(repository.existsById(zoneId)){
            ZoneModel zone = repository.findById(zoneId).get();
            zone.getData().addAll(dataToAdd);
            return dataToAdd;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }
}
