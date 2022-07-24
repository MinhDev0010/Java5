package com.poly.shop.api;

import com.poly.shop.domain.Product;
import com.poly.shop.service.Impl.CateServiceImp;
import com.poly.shop.service.Impl.ProductImp;
import com.poly.shop.utils.fileUploadUtil;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/pro")
@CrossOrigin("*")
public class productApi {
    @Autowired
    private ProductImp productImp;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private CateServiceImp cateServiceImp;

    @PostMapping("/")
    public ResponseEntity<?> createProduct(@RequestBody Product product) {
        Product product1 = this.productImp.createProduct(product);
        if (product1 != null) {
            return ResponseEntity.status(HttpStatus.OK).body(product1);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Can not save product!!");
        }
    }

    @SneakyThrows
    @PutMapping("/saveImage")
    public ResponseEntity<?> saveImage(@RequestParam("id") Long id, @RequestParam("multipart") MultipartFile multipart) {
        ResponseEntity<?> message = null;
        Product product = this.productImp.findByProductId(id);
        String fileName = StringUtils.cleanPath(multipart.getOriginalFilename());
        product.setImage(fileName);
        String uploadDir = "product-photos/";
        fileUploadUtil.saveFile(uploadDir, fileName, multipart, request);
        Product productSave = this.productImp.createProduct(product);
        try {
            if (productSave != null) {
                message = ResponseEntity.status(HttpStatus.OK).body(productSave);
            }
        } catch (Exception e) {
            message = ResponseEntity.status(HttpStatus.NOT_FOUND).body("Can Not Found ProductId " + e.getMessage());
        }
        return message;
    }

    @GetMapping("/findAllCate")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(this.cateServiceImp.findAllCategories());
    }

    @GetMapping
    public ResponseEntity<?> findAllProduct() {
        return ResponseEntity.ok(this.productImp.findAll());
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable Long productId) {
        this.productImp.deleteProduct(productId);
        return ResponseEntity.ok("Ok");
    }
}
