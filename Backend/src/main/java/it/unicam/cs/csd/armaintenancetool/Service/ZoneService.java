package it.unicam.cs.csd.armaintenancetool.Service;

import it.unicam.cs.csd.armaintenancetool.Repository.ZoneRepository;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import java.util.List;


@Service
public class ZoneService {

    @Autowired
    private ZoneRepository repository;

    private DataService dataService;


    public ZoneModel addZone(ZoneModel zone){
        if(repository.findById(zone.getId()).isPresent()){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone already exists");
        } return repository.insert(zone);
    }

    public ZoneModel deleteZone(ZoneModel zone){
        if(repository.findById(zone.getId()).isPresent()){
            repository.delete(zone);
            return zone;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid zone: this zone doesn't exist");
    }

    public ZoneModel updateZone(ZoneModel zone){
        if (repository.findById(zone.getId()).isPresent()) {
            ZoneModel old = repository.findById(zone.getId()).get();
            return repository.save(zone);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public List<DataModel> addDataToZone(List<DataModel> dataToAdd, ZoneModel.ZoneId zoneId){
        if(repository.existsById(zoneId)){
            ZoneModel zone = repository.findById(zoneId).get();
            //TODO: check if dataToAdd is ALREADY in zone with a separate method
            if(zone.getData().addAll(dataToAdd)){
                for (DataModel data : dataToAdd) {
                    if(!dataService.existById(data.getId())){
                        dataService.addData(data);
                    } else {
                        dataService.updateData(data);
                    }
                }
                repository.save(zone);
                return dataToAdd;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data already exist");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public  List<DataModel> removeDataFromZone(List<DataModel> dataToRemove, ZoneModel.ZoneId zoneId){
        if(repository.existsById(zoneId)){
            ZoneModel zone = repository.findById(zoneId).get();
            if (zone.getData().removeAll(dataToRemove)){
                for (DataModel data : dataToRemove) {
                    if(dataService.existById(data.getId())){
                        dataService.deleteData(data);
                    } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data doesn't exist");
                }
                repository.save(zone);
                return dataToRemove;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data doesn't exist");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }

    public List<DataModel> updateDataInZone(List<DataModel> dataToUpdate, ZoneModel.ZoneId zoneId) {
        if (repository.existsById(zoneId)) {
            ZoneModel zone = repository.findById(zoneId).get();
            if (zone.getData().containsAll(dataToUpdate)) {
                for (DataModel data : dataToUpdate) {
                    if (dataService.existById(data.getId())) {
                        dataService.updateData(data);
                    } else
                        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data doesn't exist");
                }
                repository.save(zone);
                return dataToUpdate;
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid data: some data doesn't exist");
        }else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Selected zone doesn't exist yet. Try to add it");
    }
}
