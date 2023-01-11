package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;
@RestController
@RequestMapping(path = "artool/zone")
public class ZoneController {

    @Autowired
    private ZoneService zoneService;

    @GetMapping("/getZone")
    public ZoneModel getZone(@RequestBody @Param("zone") ZoneId zone){
        return zoneService.getZone(zone);
    }

    @GetMapping("/getZoneByMachine")
    public List<ZoneModel> getZoneByMachine(@RequestBody @Param("zone") UUID machineId){
        return zoneService.getZoneByMachine(machineId);
    }

    @DeleteMapping("/deleteZone")
    public ZoneModel deleteZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.deleteZone(zone);
    }

    @PutMapping("/updateZone")
    public ZoneModel updateZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.updateZone(zone);
    }

    @PostMapping("/addZone")
    public ZoneModel addZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.addZone(zone);
    }
}
