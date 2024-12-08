package com.road.perfectpro.repository;

import com.road.perfectpro.vo.CareerCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CareerCategoryRepository extends JpaRepository<CareerCategory, Long> {
    List<CareerCategory> findByIsActiveTrueOrderByDisplayOrderAsc();
    CareerCategory findByName(String name);
}