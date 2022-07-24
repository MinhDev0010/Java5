package com.poly.shop.controller;

import com.poly.shop.domain.Account;
import com.poly.shop.service.Impl.accountImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/account")
public class accountController {
    @Autowired
    private accountImp accountImp;

    @GetMapping("/register")
    public String newFormRegister() {
        return "admin/account/register";
    }

    @GetMapping("/")
    public String list() {
        return "admin/account/list";
    }

    @GetMapping("/login")
    public String login() {
        return "admin/account/login";
    }

    @GetMapping("/isLogin")
    public String isLogin(@CookieValue(value = "username", defaultValue = "") String username) {
        if (username == null) {
            return "admin/account/login";
        }
        Account account = this.accountImp.findByUsername(username);
        if (account.getRole()) {
            return "/admin/categories/addOrEdit";
        } else {
            return "site/client";
        }
    }
}
