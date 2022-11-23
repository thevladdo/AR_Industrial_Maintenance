package it.unicam.cs.csd.armaintenancetool.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface ZoneRepository extends MongoRepository<ZoneModel, UUID> {
}