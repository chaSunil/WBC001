package com.road.perfectpro.repository;

import com.road.perfectpro.vo.CareerCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CareerCategoryRepository extends JpaRepository<CareerCategory, Long> {
    List<CareerCategory> findByIsActiveTrueOrderByDisplayOrderAsc();
    CareerCategory findByName(String name);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM Career c WHERE c.category.id = :categoryId")
    void deleteCareersByCategoryId(@Param("categoryId") Long categoryId);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM CareerCategory c WHERE c.id = :id")
    void deleteCareerCategoryById(@Param("id") Long id);
}