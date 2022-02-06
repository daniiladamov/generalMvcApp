package com.example.taskservice.repositories;

import com.example.taskservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByFullName(String fullName);
}
