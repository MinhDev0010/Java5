package com.poly.shop.service;

import com.poly.shop.domain.Product;

import java.util.List;

public interface ProductService {
    Product createProduct(Product product);

    Product findByProductId(Long productId);

    List<Product> findAll();

    void deleteProduct(Long productId);
}
