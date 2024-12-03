package com.road.wbc001.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.road.wbc001.vo.VideoSection;

@Repository
public interface VideoSectionRepository extends JpaRepository<VideoSection, Long> {
    VideoSection findFirstByOrderByIdAsc();
} 