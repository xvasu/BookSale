package com.example.BookSale.models;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table( name = "products")
@Data

public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    @Column(length = 3000)
    private String description;
    private int price;
    @Column( name = "author")
    private String author;
    @Column( name = "publishing_house")
    private String publishingHouse;
    @Column (name="section")
    private String  section;

    @OneToMany(cascade= CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Image> images = new ArrayList<>();
    @ManyToOne(cascade= CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    private Long previewImageId;
    private LocalDateTime dateOfCreation;

    @PrePersist
   private void onCreate(){dateOfCreation= LocalDateTime.now();}

    public void addImageToProduct(Image image){
    image.setProduct(this);
    images.add(image);
    }
}
