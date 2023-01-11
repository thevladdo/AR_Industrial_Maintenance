package it.unicam.cs.csd.armaintenancetool.Model;


import org.springframework.data.annotation.Id;
import java.util.UUID;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class MachineModel {

    @Id
    private UUID id;
    private String name;
    private String description;
    private String status;
    private String timestamp;
}
