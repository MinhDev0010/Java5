package com.poly.shop.service;

import com.poly.shop.domain.Category;

import java.util.List;

public interface ICateService {
    List<Category> findAllCategories();

    Category createCategory(Category category);

    void deleteCategory(Long id);

    Category findById(Long id);
}
