package com.road.wbc001.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.road.wbc001.vo.Career;

public interface CareerRepository extends JpaRepository<Career, Long> {
}