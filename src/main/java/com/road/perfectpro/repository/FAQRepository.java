package com.road.perfectpro.repository;

import com.road.perfectpro.vo.FAQ;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface FAQRepository extends JpaRepository<FAQ, Long> {
    @Query("SELECT f FROM FAQ f WHERE f.isActive = true ORDER BY f.displayOrder ASC")
    List<FAQ> findByIsActiveTrueOrderByDisplayOrderAsc();
} 