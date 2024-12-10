package com.road.perfectpro.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.road.perfectpro.vo.ReviewSection;

@Repository
public interface ReviewSectionRepository extends JpaRepository<ReviewSection, Long> {
    @Query("SELECT r FROM ReviewSection r ORDER BY r.displayOrder")
    List<ReviewSection> findAllByOrderByDisplayOrderAsc();
} 