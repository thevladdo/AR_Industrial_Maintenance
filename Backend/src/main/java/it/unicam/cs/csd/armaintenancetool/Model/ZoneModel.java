package it.unicam.cs.csd.armaintenancetool.Model;

import org.springframework.data.annotation.Id;
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
    private String name;
    private double value;
    private UUID machineId;

}

