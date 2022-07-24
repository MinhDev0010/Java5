package com.poly.shop.service.Impl;

import com.poly.shop.domain.Category;
import com.poly.shop.repository.categoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CateServiceImp implements com.poly.shop.service.ICateService {
    @Autowired
    private categoryRepository categoryRepository;

    @Override
    public List<Category> findAllCategories() {
        return this.categoryRepository.findAll();
    }

    @Override
    public Category createCategory(Category category) {
        return this.categoryRepository.save(category);
    }

    @Override
    public void deleteCategory(Long id) {
        this.categoryRepository.deleteById(id);
    }

    @Override
    public Category findById(Long id) {
        return this.categoryRepository.findById(id).orElse(null);
    }
}
