package com.road.perfectpro.vo;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.FetchType;

@Entity
@Table(name = "careers")
@Getter
@Setter
public class Career {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    private String period;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "about_section_id")
    private AboutSection aboutSection;
    
    public AboutSection getAboutSection() {
        return aboutSection;
    }

    public void setAboutSection(AboutSection aboutSection) {
        this.aboutSection = aboutSection;
    }
}