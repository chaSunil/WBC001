package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param;

import com.road.perfectpro.vo.SuccessCase;
import java.util.List;
import java.util.Optional;

@Repository
public interface SuccessCaseRepository extends JpaRepository<SuccessCase, Long> {
    @Query("SELECT DISTINCT sc FROM SuccessCase sc LEFT JOIN FETCH sc.categories WHERE sc.isActive = true ORDER BY sc.displayOrder")
    List<SuccessCase> findAllActiveWithCategories();
    
    @Query("SELECT sc FROM SuccessCase sc LEFT JOIN FETCH sc.categories WHERE sc.id = :id")
    Optional<SuccessCase> findByIdWithCategories(@Param("id") Long id);
}