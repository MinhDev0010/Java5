package com.poly.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/product")
public class productController {
    @GetMapping("/add")
    public String addProduct() {
        return "admin/products/addOrEdit";
    }

    @GetMapping()
    public String listProduct() {
        return "admin/products/listProducts";
    }
}
