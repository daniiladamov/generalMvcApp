package com.example.taskservice.controllers;

import com.example.taskservice.entity.User;
import com.example.taskservice.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String create(User user){
        if(userService.createUser(user)) return "redirect:/user-panel";
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String login(){return "login";}

    @GetMapping("/user-panel")
    public String userPanel(Principal principal, Model model){
        model.addAttribute("user", userService.findByPrincipal(principal));
        return "user-panel";

    }

    @GetMapping("/")
    public String home(Principal principal){
        if (principal!=null) return "redirect:/user-panel";
        return "home";
    }


}
