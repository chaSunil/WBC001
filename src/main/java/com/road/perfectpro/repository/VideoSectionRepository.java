package com.road.perfectpro.repository;

import com.road.perfectpro.vo.VideoSection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface VideoSectionRepository extends JpaRepository<VideoSection, Long> {
    @Query("SELECT v FROM VideoSection v LEFT JOIN FETCH v.videos WHERE v.id = :id")
    Optional<VideoSection> findByIdWithVideos(@Param("id") Long id);
    
    @Query("SELECT v FROM VideoSection v LEFT JOIN FETCH v.videos WHERE v.id = (SELECT MIN(vs.id) FROM VideoSection vs)")
    VideoSection findFirstByOrderByIdAsc();
} 