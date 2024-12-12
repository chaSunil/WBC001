package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.road.perfectpro.vo.Expertise;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpertiseRepository extends JpaRepository<Expertise, Long> {
    @Query("SELECT DISTINCT e FROM Expertise e LEFT JOIN FETCH e.details WHERE e.isActive = true ORDER BY e.displayOrder ASC")
    List<Expertise> findAllWithDetails();
} 