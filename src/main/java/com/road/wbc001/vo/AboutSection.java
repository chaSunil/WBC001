package com.road.perfectpro.vo;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "about_section")
@Getter
@Setter
public class AboutSection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String lawyerName;
    private String specialty;
    private String association;
    private String profileImage;
    private String greeting;
    private String signatureImage;
    
    @OneToMany(mappedBy = "aboutSection", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Career> careers = new ArrayList<>();
    
    public void addCareer(Career career) {
        careers.add(career);
        career.setAboutSection(this);
    }
    
    public void removeCareer(Career career) {
        careers.remove(career);
        career.setAboutSection(null);
    }
}