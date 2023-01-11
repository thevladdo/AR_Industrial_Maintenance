package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.DataRepository;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;

import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class DataService {
    @Autowired
    private DataRepository repository;

    public DataModel addData(DataModel data){
        if(data.getName()!=null){
            data.setId(UUID.randomUUID());
            return repository.insert(data);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid machine");
    }

    public boolean deleteData(UUID data){
        if(repository.existsById(data)){
            repository.deleteById(data);
            return true;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: this data doesn't exist");
    }

    public boolean deleteAllById(List<UUID> data){
        repository.deleteAllById(data);
        return true;
    }

    public DataModel updateData(DataModel data){
        if (repository.findById(data.getId()).isPresent()) {
            return repository.save(data);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected data doesn't exist yet. Try to add it");
    }

    public DataModel getData(UUID id){
        if (repository.existsById(id)) {
            Optional<DataModel> optional= repository.findById(id);
            return optional.get();
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected data doesn't exist yet. Try to add it");
    }

    public List<DataModel> getListData(List<UUID> ids){
        return (List<DataModel>) repository.findAllById(ids);
    }

    public List<DataModel> getDataByZone(ZoneId zoneId){
        return (List<DataModel>) repository.findByZoneId(zoneId);
    }

    public boolean existById(UUID id){
        return repository.existsById(id);
    }
}
