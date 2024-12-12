package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.road.perfectpro.vo.ExpertiseDetail;
import java.util.List;

public interface ExpertiseDetailRepository extends JpaRepository<ExpertiseDetail, Long> {
    List<ExpertiseDetail> findByExpertise_IdOrderByDisplayOrderAsc(Long expertiseId);
} 