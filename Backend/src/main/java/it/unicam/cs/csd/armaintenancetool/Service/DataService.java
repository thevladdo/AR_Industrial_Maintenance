package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.DataRepository;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;

@Service
public class DataService {
    @Autowired
    private DataRepository repository;

    public DataModel addData(DataModel data){
        if(repository.findById(data.getId()).isPresent()){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: this data already exists");
        } return repository.insert(data);
    }

    public DataModel deleteData(DataModel data){
        if(repository.findById(data.getId()).isPresent()){
            repository.delete(data);
            return data;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: this data doesn't exist");
    }

    public DataModel updateData(DataModel data){
        if (repository.findById(data.getId()).isPresent()) {
            DataModel old = repository.findById(data.getId()).get();
            return repository.save(data);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected data doesn't exist yet. Try to add it");
    }
}
