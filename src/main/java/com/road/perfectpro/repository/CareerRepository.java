package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.road.perfectpro.vo.Career;

public interface CareerRepository extends JpaRepository<Career, Long> {
}