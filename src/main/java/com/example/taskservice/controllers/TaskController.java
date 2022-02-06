package com.example.taskservice.controllers;

import com.example.taskservice.entity.Task;
import com.example.taskservice.service.TaskService;
import com.example.taskservice.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class TaskController {
    private final UserService userService;
    private final TaskService taskService;
    @GetMapping("/create-task")
    public String createTask(Model model){
        model.addAttribute("list",userService.getList());
              return "create-task";
    }
   @PostMapping("/create-task")
    public String newTask(Task task, @RequestParam(name = "to")String nameTo, Principal principal){
        taskService.createTask(task, nameTo, principal);
      return "redirect:/user-panel";
    }

    @GetMapping("/task-info/{id}")
    public String taskInfo(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("task",taskService.getById(id));
        model.addAttribute("user", taskService.getByPrincipal(principal));
        return "task-info";
    }
    @PostMapping("/complete-task/{id}")
    public String completeTask(@PathVariable Long id, @RequestParam(name = "comment") String comment){
        taskService.completeTask(id, comment);
        return "redirect:/task-info/"+id;
    }

}
