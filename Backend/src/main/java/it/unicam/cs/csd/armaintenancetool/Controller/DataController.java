package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import it.unicam.cs.csd.armaintenancetool.Model.DataModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "artool/data")
public class DataController {

    @Autowired
    private DataService service;

    @GetMapping("/getData")
    public DataModel getZone(@RequestBody @Param("zone") UUID data){
        return service.getData(data);
    }

    @GetMapping("/getDataByZone")
    public List<DataModel> getDataByZone(@RequestBody @Param("zone") ZoneId zoneId){
        return service.getDataByZone(zoneId);
    }

    @DeleteMapping("/deleteData")
    public boolean deleteData(@RequestBody @Param("data") UUID data){
        return service.deleteData(data);
    }
    @DeleteMapping("/deleteMultipleData")
    public boolean deleteMultiData(@RequestBody @Param("data") List<UUID> data){
        return service.deleteAllById(data);
    }

    @PutMapping("/updateData")
    public DataModel updateData(@RequestBody @Param("data") DataModel data){
        return service.updateData(data);
    }

    @PostMapping("/addData")
    public DataModel addData(@RequestBody @Param("data") DataModel data){
        return service.addData(data);
    }
}
