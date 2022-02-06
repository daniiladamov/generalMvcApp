package com.example.taskservice.service;

import com.example.taskservice.entity.Role;
import com.example.taskservice.entity.User;
import com.example.taskservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user){
        User user1=userRepository.findByUsername(user.getUsername());
        if (user1!=null)
        return false;
        user.setActive(true);
        user.setFullName(user.getFirstName()+" "+user.getSecondName());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoleSet().add(Role.ROLE_USER);
        userRepository.save(user);
        log.info("create user: {}",user.getUsername());
        return true;
    }

    public User findById(Long id) {

    return userRepository.findById(id).orElse(null);}

    public List<User> getList(){ return userRepository.findAll();}

    public User findByPrincipal(Principal principal){
        return userRepository.findByUsername(principal.getName());
    }
}
