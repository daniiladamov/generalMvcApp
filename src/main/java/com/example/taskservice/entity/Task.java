package com.example.taskservice.entity;

import lombok.Data;
import javax.persistence.*;
import java.time.LocalDate;


@Entity
@Table(name = "tasks")
@Data
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "text")
    private String topic;
    @Column(columnDefinition = "text")
    private String description;
    @Column(columnDefinition = "text")
    private String comment;
    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
    @JoinColumn
    private User userTo;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User userFrom;
    private boolean status;
    private LocalDate dateOfCreate;
    private LocalDate dateOfFinish;
    @Enumerated(EnumType.STRING)
    private TaskStatus taskStatus;

    @PrePersist
    private void init(){ dateOfCreate= LocalDate.now();
    taskStatus=TaskStatus.IN_PROGRESS;
    }

    public boolean complete() {
        if (status) return false;
        dateOfFinish=LocalDate.now();
        status=true;
        taskStatus=TaskStatus.FINISHED;
        return true;
    }
}
