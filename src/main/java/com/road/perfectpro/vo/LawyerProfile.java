package com.road.perfectpro.vo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "lawyer_profile")
@Getter @Setter
public class LawyerProfile {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    private String profileImage;
    private String subtitle1;
    private String subtitle2;
    
    @Column(columnDefinition = "TEXT")
    private String greetingContent;
    
    private String signatureName;
    private String signatureImage;
    
    @JsonManagedReference
    @OneToMany(mappedBy = "lawyerProfile", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("displayOrder ASC")
    private List<LawyerCareer> careers = new ArrayList<>();
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public void setCareers(List<LawyerCareer> careers) {
        this.careers.clear();
        if (careers != null) {
            careers.forEach(this::addCareer);
        }
    }

    public void addCareer(LawyerCareer career) {
        this.careers.add(career);
        career.setLawyerProfile(this);
    }
}