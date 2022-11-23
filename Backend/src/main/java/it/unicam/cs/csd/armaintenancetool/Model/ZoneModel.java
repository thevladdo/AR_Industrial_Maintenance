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
    private UUID id;
    private int machineId;
    private ArrayList<DataModel> data;
    private double value;
    private double coordinateX;
    private double coordinateY;
    private double coordinateZ;

}