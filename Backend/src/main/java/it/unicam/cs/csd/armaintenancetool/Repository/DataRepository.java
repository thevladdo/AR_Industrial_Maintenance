package it.unicam.cs.csd.armaintenancetool.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;


import java.util.List;
import java.util.UUID;

public interface DataRepository extends MongoRepository<DataModel, UUID> {

    List<DataModel> findByZoneId(ZoneId zoneId);

}

