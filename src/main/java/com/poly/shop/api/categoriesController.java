package com.poly.shop.api;

import com.poly.shop.domain.Category;
import com.poly.shop.service.Impl.CateServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cate")
@CrossOrigin("*")
public class categoriesController {
    @Autowired
    private CateServiceImp categoryService;

    @GetMapping("/")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(this.categoryService.findAllCategories());
    }

    @PostMapping("/")
    public ResponseEntity<?> createCategory(@RequestBody Category category) {
        Category category1 = this.categoryService.createCategory(category);
        if (category1 != null) {
            return ResponseEntity.status(HttpStatus.OK).body(category1);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Create category is failed");
        }
    }

    @PutMapping("/")
    public ResponseEntity<?> updateCategory(@RequestBody Category category) {
        Category category1 = this.categoryService.createCategory(category);
        if (category1 != null) {
            return ResponseEntity.status(HttpStatus.OK).body(category1);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("update category is failed");
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delCategory(@PathVariable Long id) {
        this.categoryService.deleteCategory(id);
        return ResponseEntity.ok("Delete is successfully");

    }

    @GetMapping("/{id}")
    public ResponseEntity<?> findById(@PathVariable("id") Long id) {
        Category category = this.categoryService.findById(id);
        if (category != null) {
            return ResponseEntity.status(HttpStatus.OK).body(category);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Can not find category");
        }
    }
}
