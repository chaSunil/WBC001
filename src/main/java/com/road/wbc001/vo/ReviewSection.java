package com.road.wbc001.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "review_section")
@Getter
@Setter
public class ReviewSection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String clientName;
    
    @Column(nullable = false)
    private String caseType;
    
    @Column(nullable = false)
    private String reviewDate;
    
    @Column(nullable = false, length = 2000)
    private String content;
    
    @Column(nullable = false, length = 500)
    private String previewContent;
    
    @Column(nullable = false)
    private String profileImage;
    
    private Integer displayOrder;
    
    @Column(nullable = false)
    private Boolean isActive = false;
} 