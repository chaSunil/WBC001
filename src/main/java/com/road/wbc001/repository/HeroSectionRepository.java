package com.road.wbc001.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.road.wbc001.vo.HeroSection;

@Repository
public interface HeroSectionRepository extends JpaRepository<HeroSection, Long> {
    Optional<HeroSection> findFirstByOrderByIdDesc();
}
