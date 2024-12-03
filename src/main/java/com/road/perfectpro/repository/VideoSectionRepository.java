package com.road.perfectpro.repository;

import com.road.perfectpro.vo.VideoSection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VideoSectionRepository extends JpaRepository<VideoSection, Long> {
    VideoSection findFirstByOrderByIdAsc();
} 