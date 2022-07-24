package com.poly.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/categories")
public class categoryController {

    @GetMapping("/add")
    public String add(Model model) {
        return "admin/categories/addOrEdit";
    }
    
    @GetMapping
    public String list(ModelMap model) {

        return "admin/categories/list";
    }

}
