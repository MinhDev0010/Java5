package com.poly.shop.service.Impl;

import com.poly.shop.domain.Product;
import com.poly.shop.repository.productRepository;
import com.poly.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImp implements ProductService {
    @Autowired
    private productRepository productRepository;

    @Override
    public Product createProduct(Product product) {
        return this.productRepository.save(product);
    }

    @Override
    public Product findByProductId(Long productId) {
        return this.productRepository.findById(productId).orElse(null);
    }

    @Override
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public void deleteProduct(Long productId) {
        this.productRepository.deleteById(productId);
    }
}
