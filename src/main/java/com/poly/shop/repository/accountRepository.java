package com.poly.shop.repository;

import com.poly.shop.domain.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface accountRepository extends JpaRepository<Account, String> {
    Optional<Account> findByUsernameAndPassword(String username, String password);
}
