package com.example.taskservice.service;

import com.example.taskservice.entity.Task;
import com.example.taskservice.entity.User;
import com.example.taskservice.repositories.TaskRepository;
import com.example.taskservice.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.security.Principal;


@Service
@RequiredArgsConstructor
@Slf4j
public class TaskService {
   private final TaskRepository taskRepository;
   private final UserRepository userRepository;

   public boolean createTask(Task task, String nameTo, Principal principal){
if(task.getDescription()== null) return false;
User userTo=userRepository.findByFullName(nameTo);
User userFrom=getByPrincipal(principal);
userTo.getTaskTo().add(task);
synchronized (userTo){
    userTo.setCountOfTasks(userTo.getCountOfTasks()+1);
}
userFrom.getTaskFrom().add(task);
task.setUserFrom(userFrom);
task.setUserTo(userTo);
taskRepository.save(task);
log.info("create Task#{}, for {}",task.getId(),userTo.getUsername());
return true;
   }

   public User getByPrincipal(Principal principal) {
      if (principal==null) return null;
      return userRepository.findByUsername(principal.getName());
   }

    public Task getById(Long id) {
       return taskRepository.findById(id).orElse(null);
    }

    public boolean completeTask(Long id, String comment) {
       Task task=taskRepository.findById(id).orElse(null);
       if (task==null||!task.complete()) return false;
       task.setComment(comment);
       User user=task.getUserTo();
       synchronized (user){
           user.setCountOfTasks(user.getCountOfTasks()-1);
       }
       log.info("task #{} was completed",id);
       taskRepository.save(task);
       return true;



    }
}
