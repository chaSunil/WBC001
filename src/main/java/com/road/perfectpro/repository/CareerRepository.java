package com.road.perfectpro.repository;

import com.road.perfectpro.vo.Career;
import com.road.perfectpro.vo.CareerCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CareerRepository extends JpaRepository<Career, Long> {
    
    // 카테고리별 활성화된 경력 목록 조회 (표시순서로 정렬)
    List<Career> findByCategoryAndIsActiveTrueOrderByDisplayOrderAsc(CareerCategory category);
    
    // 모든 활성화된 경력 목록 조회
    List<Career> findByIsActiveTrueOrderByDisplayOrderAsc();
    
    // 카테고리별 모든 경력 목록 조회 (관리자용)
    List<Career> findByCategoryOrderByDisplayOrderAsc(CareerCategory category);
    
    // 표시 순서 최대값 조회
    @Query("SELECT MAX(c.displayOrder) FROM Career c WHERE c.category = :category")
    Integer findMaxDisplayOrderByCategory(CareerCategory category);
}