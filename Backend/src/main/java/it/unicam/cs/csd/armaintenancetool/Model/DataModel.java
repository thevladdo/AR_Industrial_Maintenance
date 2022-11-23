package it.unicam.cs.csd.armaintenancetool.Model;
import org.springframework.data.annotation.Id;
import java.util.UUID;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class DataModel {
    @Id
    private UUID id;
    private String name;
    private double value;
    private double coordinateX;
    private double coordinateY;
    private double coordinateZ;
    private String unit;
    private String timestamp;
    private String sensor;
}



