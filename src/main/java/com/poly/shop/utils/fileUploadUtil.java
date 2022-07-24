package com.poly.shop.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class fileUploadUtil {
    public static void saveFile(String uploadDir, String fileName, MultipartFile multipartFile, HttpServletRequest request) throws IOException {

        Path path = Paths.get(request.getSession().getServletContext().getRealPath(uploadDir));
        if (!Files.exists(path)) {
            Files.createDirectories(path);
        }
        try (InputStream inputStream = multipartFile.getInputStream()) {
            Path filePath = path.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            throw new IOException("Count not save image file" + fileName);
        }
    }
}
