package com.example.BookSale.repositories;

import com.example.BookSale.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository <User, Long> {
    User findByEmail(String email);

}
