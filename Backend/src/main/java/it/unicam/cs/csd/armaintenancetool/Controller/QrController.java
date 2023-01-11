package it.unicam.cs.csd.armaintenancetool.Controller;

import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import it.unicam.cs.csd.armaintenancetool.Service.QrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.awt.image.BufferedImage;

@RestController
@RequestMapping(path = "artool/zone/qr")
public class QrController {

    @Autowired
    private QrService service;


    @GetMapping(path = "/generate", produces = MediaType.IMAGE_PNG_VALUE)
    public BufferedImage createQr(@RequestBody @Param("zoneId") ZoneId zoneId){
        return service.generateQRCodeImage(zoneId);
    }

/*    @GetMapping("/decode")
    public String decode(MultipartFile file, RedirectAttributes redirectAttributes){
        if(file.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Please choose file to upload.");
            return "redirect:/";
        }
        try {
            return service.decodeQR(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }*/
}
