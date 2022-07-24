package com.poly.shop.repository;

import com.poly.shop.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface productRepository extends JpaRepository<Product, Long> {
}
