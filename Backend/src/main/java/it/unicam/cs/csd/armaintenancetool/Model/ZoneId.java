package it.unicam.cs.csd.armaintenancetool.Model;


import java.util.UUID;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ZoneId{
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
