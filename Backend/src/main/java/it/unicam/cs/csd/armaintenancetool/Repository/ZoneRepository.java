package it.unicam.cs.csd.armaintenancetool.Repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;


public interface ZoneRepository extends MongoRepository<ZoneModel, ZoneId> {
    
    List<ZoneModel> findByMachineId(UUID machineId);

}