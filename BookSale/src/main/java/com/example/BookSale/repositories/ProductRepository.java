package com.example.BookSale.repositories;

import com.example.BookSale.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository <Product, Long> {
    List<Product> findByTitle(String title);

}
