package com.road.wbc001.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "video_section")
@Getter @Setter
public class VideoSection {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String mainTitle;
    
    @OneToMany(mappedBy = "videoSection", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("number asc")
    private List<Video> videos = new ArrayList<>();
    
    public void addVideo(Video video) {
        videos.add(video);
        video.setVideoSection(this);
    }
}