package com.road.wbc001.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.road.wbc001.vo.ReviewSection;

@Repository
public interface ReviewSectionRepository extends JpaRepository<ReviewSection, Long> {
    List<ReviewSection> findAllByOrderByDisplayOrderAsc();
} 