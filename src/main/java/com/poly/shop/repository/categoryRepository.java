package com.poly.shop.repository;

import com.poly.shop.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface categoryRepository extends JpaRepository<Category, Long> {
}
