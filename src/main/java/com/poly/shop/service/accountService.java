package com.poly.shop.service;

import com.poly.shop.domain.Account;

import java.util.List;

public interface accountService {
    Account createAccount(Account account);

    List<Account> findAll();

    Account login(String username, String password);

    Account findByUsername(String username);

    void deleteAccount(String username);
}
