package com.road.perfectpro.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "video")
@Getter @Setter
public class Video {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private Integer number;
    private String videoId;  // YouTube 비디오 ID
    private String title;
    private String description;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "video_section_id")
    private VideoSection videoSection;
} 