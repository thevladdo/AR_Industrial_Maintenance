package it.unicam.cs.csd.armaintenancetool.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface MachineRepository extends MongoRepository<MachineModel, UUID> {
}
