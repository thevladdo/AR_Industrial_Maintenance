package it.unicam.cs.csd.armaintenancetool.Service;

import com.google.zxing.*;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;

import it.unicam.cs.csd.armaintenancetool.Model.ZoneId;
import lombok.NonNull;
import org.springframework.stereotype.Service;
import java.awt.image.BufferedImage;

@Service
public class QrService {

    public BufferedImage generateQRCodeImage(@NonNull ZoneId zoneId){
        String text = zoneId.toString();
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = null;
        try {
            bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 500, 500);
        } catch (WriterException e) {
            e.printStackTrace();
        }
        assert bitMatrix != null;
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
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
