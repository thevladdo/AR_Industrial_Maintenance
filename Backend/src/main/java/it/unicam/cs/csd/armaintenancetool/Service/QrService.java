package it.unicam.cs.csd.armaintenancetool.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.*;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;

import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import lombok.NonNull;
import org.springframework.stereotype.Service;
import java.awt.image.BufferedImage;
import java.io.*;

import javax.imageio.ImageIO;

@Service
public class QrService {

    public byte[] generateQRCodeImage(@NonNull ZoneId zoneId) throws IOException, WriterException{
        ObjectMapper mapper = new ObjectMapper();
        String text = mapper.writeValueAsString(zoneId);

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 500, 500);

        BufferedImage image = MatrixToImageWriter.toBufferedImage(bitMatrix);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", baos);
        byte[] bytes = baos.toByteArray();

        return bytes;
    }

    /*public String decodeQR(byte[] qrCodeBytes) {
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(qrCodeBytes);
            BufferedImage bufferedImage = ImageIO.read(byteArrayInputStream);
            BufferedImageLuminanceSource bufferedImageLuminanceSource = new BufferedImageLuminanceSource(bufferedImage);
            HybridBinarizer hybridBinarizer = new HybridBinarizer(bufferedImageLuminanceSource);
            BinaryBitmap binaryBitmap = new BinaryBitmap(hybridBinarizer);
            MultiFormatReader multiFormatReader = new MultiFormatReader();
            return multiFormatReader.decode(binaryBitmap).getText();
        } catch (NotFoundException | IOException e) {
            e.printStackTrace();
        }
        return null;
    }*/
}
