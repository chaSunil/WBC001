package com.road.perfectpro.repository;

import com.road.perfectpro.vo.Career;
import com.road.perfectpro.vo.CareerCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CareerRepository extends JpaRepository<Career, Long> {
    
    // 카테고리별 활성화된 경력 목록 조회 (표시순서로 정렬)
    @Query("SELECT c FROM Career c JOIN FETCH c.category WHERE c.isActive = true AND c.category = :category ORDER BY c.displayOrder")
    List<Career> findByCategoryAndIsActiveTrueOrderByDisplayOrderAsc(@Param("category") CareerCategory category);
    
    // 모든 활성화된 경력 목록 조회
    @Query("SELECT c FROM Career c JOIN FETCH c.category WHERE c.isActive = true ORDER BY c.displayOrder")
    List<Career> findByIsActiveTrueOrderByDisplayOrderAsc();
    
    // 카테고리별 모든 경력 목록 조회 (관리자용)
    @Query("SELECT c FROM Career c JOIN FETCH c.category WHERE c.category = :category ORDER BY c.displayOrder")
    List<Career> findByCategoryOrderByDisplayOrderAsc(@Param("category") CareerCategory category);
    
    // 표시 순서 최대값 조회
    @Query("SELECT MAX(c.displayOrder) FROM Career c WHERE c.category = :category")
    Integer findMaxDisplayOrderByCategory(@Param("category") CareerCategory category);
    
    @Query("SELECT c FROM Career c JOIN FETCH c.category ORDER BY c.category.displayOrder, c.displayOrder")
    List<Career> findAllWithCategory();
    
    @Query("SELECT c FROM Career c JOIN FETCH c.category WHERE c.id = :id")
    Optional<Career> findCareerWithCategory(@Param("id") Long id);
}