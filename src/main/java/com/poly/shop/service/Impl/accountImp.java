package com.poly.shop.service.Impl;

import com.poly.shop.domain.Account;
import com.poly.shop.repository.accountRepository;
import com.poly.shop.service.accountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class accountImp implements accountService {
    @Autowired
    private accountRepository accountRepository;

    @Override
    public Account createAccount(Account account) {
        return this.accountRepository.save(account);
    }

    @Override
    public List<Account> findAll() {
        return this.accountRepository.findAll();
    }

    @Override
    public Account login(String username, String password) {
        return this.accountRepository.findByUsernameAndPassword(username, password).orElse(null);
    }

    @Override
    public Account findByUsername(String username) {
        return this.accountRepository.findById(username).orElse(null);
    }

    @Override
    public void deleteAccount(String username) {
        this.accountRepository.deleteById(username);
    }

}
