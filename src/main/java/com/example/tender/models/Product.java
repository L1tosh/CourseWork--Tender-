package com.example.tender.models;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "views")
    private int views;
    @Column(name = "title")
    private String title;
    @Column(name = "price")
    private int price;
    @Column(name = "company")
    private String company;
    @Column(name = "city")
    private String city;
    @Column(name = "timeStart")
    private String timeStart;
    @Column(name = "timeEnd")
    private String timeEnd;
    @Column(name = "littleDescription", columnDefinition = "text")
    private  String littleDescription;
    @Column(name = "description", columnDefinition = "text")
    private  String description;
    @Column(name = "active")
    private boolean active;


    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Offer> offers = new ArrayList<>();

    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }




}