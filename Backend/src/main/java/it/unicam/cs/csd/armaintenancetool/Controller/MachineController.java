package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Model.MachineModel;
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
    
    @GetMapping("/getMachine")
    public MachineModel getMachine(@RequestBody @Param("machine") UUID id){
        return machineService.getMachine(id);
    }

    @GetMapping("/getAllMachine")
    public List<MachineModel> getAllMachine(){
        return machineService.findAll();
    }

    @PostMapping("/addMachine")
    public MachineModel add(@RequestBody @Param("machine") MachineModel machine){
        return machineService.addMachine(machine);
    }

    @PutMapping("/updateMachine")
    public MachineModel update(@RequestBody @Param("machine") MachineModel machine){
        return machineService.updateMachine(machine);
    }

    @DeleteMapping("/deleteMachine")
    public boolean delete(@RequestBody @Param("machine") UUID machine){
        return machineService.deleteMachine(machine);
    }

    // @PutMapping("/addZone")
    // public List<ZoneModel> addZoneToMachine(@RequestBody @Param("machineId") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
    //     return machineService.addZoneToMachine(zone, machineId);
    // }

    // @PutMapping("/removeZone")
    // public List<ZoneModel> removeZoneFromMachine(@RequestBody @Param("machineId") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
    //     return machineService.removeZoneFromMachine(zone, machineId);
    // }

    // @PutMapping("/updateZone")
    // public List<ZoneModel> updateZoneInMachine(@RequestBody @Param("machineId") UUID machineId, @RequestBody @Param("zone") List<ZoneModel> zone){
    //     return machineService.updateZoneInMachine(zone, machineId);
    // }
}
