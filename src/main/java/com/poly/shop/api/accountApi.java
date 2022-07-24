package com.poly.shop.api;

import com.poly.shop.domain.Account;
import com.poly.shop.service.Impl.accountImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/acc")
@CrossOrigin("*")
public class accountApi {
    @Autowired
    private accountImp accountService;
    @Autowired
    HttpServletResponse response;

    @PostMapping("/")
    public ResponseEntity<?> createAccount(@RequestBody Account account) {
        Account ac = this.accountService.createAccount(account);
        if (ac != null) {
            return ResponseEntity.status(HttpStatus.OK).body(ac);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("ERROR:Create account is failed!!");
        }
    }

    @GetMapping("/")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(this.accountService.findAll());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestParam("username") String username, @RequestParam("password") String password) {
        Account account = this.accountService.login(username, password);
        Cookie cookie = new Cookie("username", account.getUsername());
        cookie.setMaxAge(10 * 24 * 60);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        response.addCookie(cookie);
        return ResponseEntity.ok(account);
    }

    @GetMapping("/{username}")
    public ResponseEntity<?> findByUsername(@PathVariable("username") String username) {
        Account account = this.accountService.findByUsername(username);
        if (account == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Can not find username!!");
        } else {
            return ResponseEntity.status(HttpStatus.OK).body(account);
        }
    }

    @PutMapping("/")
    public ResponseEntity<?> updateAccount(@RequestBody Account ac) {
        Account account = this.accountService.createAccount(ac);
        if (account != null) {
            return ResponseEntity.status(HttpStatus.OK).body(account);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Failed!");
        }
    }

    @DeleteMapping("/{username}")
    public ResponseEntity<?> delete(@PathVariable String username) {
        this.accountService.deleteAccount(username);
        return ResponseEntity.ok("Delete is successfully!!");
    }
}
