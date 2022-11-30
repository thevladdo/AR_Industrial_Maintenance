package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping(path = "artool/zone")
public class ZoneController {

    @Autowired
    private ZoneService zoneService;

    @PostMapping("/addZone")
    public ZoneModel addZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.addZone(zone);
    }

    @DeleteMapping("/deleteZone")
    public ZoneModel deleteZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.deleteZone(zone);
    }

    @PutMapping("/updateZone")
    public ZoneModel updateZone(@RequestBody @Param("zone") ZoneModel zone){
        return zoneService.updateZone(zone);
    }

    @PutMapping("/addData")
    public List<DataModel> addDataToZone(@RequestBody @Param("data") List<DataModel> data, @Param("zoneId") ZoneModel.ZoneId zoneId){
        return zoneService.addDataToZone(data, zoneId);
    }

    @PutMapping("/removeData")
    public List<DataModel> removeDataFromZone(@RequestBody @Param("data") List<DataModel> data, @Param("zoneId") ZoneModel.ZoneId zoneId){
        return zoneService.removeDataFromZone(data, zoneId);
    }

    @PutMapping("/updateData")
    public List<DataModel> updateDataInZone(@RequestBody @Param("data") List<DataModel> data, @Param("zoneId") ZoneModel.ZoneId zoneId){
        return zoneService.updateDataInZone(data, zoneId);
    }
}
