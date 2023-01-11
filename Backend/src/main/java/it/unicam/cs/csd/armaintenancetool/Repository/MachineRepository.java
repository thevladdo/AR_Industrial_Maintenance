package it.unicam.cs.csd.armaintenancetool.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import java.util.UUID;


public interface MachineRepository extends MongoRepository<MachineModel, UUID> {
}
