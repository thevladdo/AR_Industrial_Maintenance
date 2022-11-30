package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
import it.unicam.cs.csd.armaintenancetool.Model.ZoneModel;
import it.unicam.cs.csd.armaintenancetool.Service.MachineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "artool/machine")
public class MachineController {

    @Autowired
    private MachineService machineService;

    @PostMapping("/addMachine")
    public MachineModel add(@RequestBody @Param("machine") MachineModel machine){
        return machineService.addMachine(machine);
    }

    @PutMapping("/updateMachine")
    public MachineModel update(@RequestBody @Param("machine") MachineModel machine){
        return machineService.updateMachine(machine);
    }

    @DeleteMapping("/deleteMachine")
    public MachineModel delete(@RequestBody @Param("machine") MachineModel machine){
        return machineService.deleteMachine(machine);
    }

    @PutMapping("/addZone")
    public List<ZoneModel> addZoneToMachine(@RequestBody @Param("machine") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
        return machineService.addZoneToMachine(zone, machineId);
    }

    @PutMapping("/removeZone")
    public List<ZoneModel> removeZoneFromMachine(@RequestBody @Param("machine") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
        return machineService.removeZoneFromMachine(zone, machineId);
    }

    @PutMapping("/updateZone")
    public List<ZoneModel> updateZoneInMachine(@RequestBody @Param("machine") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
        return machineService.updateZoneInMachine(zone, machineId);
    }
}
