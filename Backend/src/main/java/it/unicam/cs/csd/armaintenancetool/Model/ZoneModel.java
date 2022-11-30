package it.unicam.cs.csd.armaintenancetool.Model;

import org.springframework.data.annotation.Id;
import java.util.ArrayList;
import java.util.UUID;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ZoneModel {

    @Id
    private ZoneId id;
    private ArrayList<DataModel> data;
    private double value;

    @Getter
    @Setter
    @EqualsAndHashCode(onlyExplicitlyIncluded = true)
    public static class ZoneId{
        private UUID machineId;
        private UUID zoneNum;

        /*
        In the DB, this class will be displayed in this way:
        {
            "machineId": "machineId",
            "zoneNum": "zoneNum"
        }
        */
    }

}

