package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.road.perfectpro.vo.LegalGuide;
import java.util.List;

public interface LegalGuideRepository extends JpaRepository<LegalGuide, Long> {
    List<LegalGuide> findAllByOrderByDisplayOrderAsc();
    List<LegalGuide> findByIsActiveTrueOrderByDisplayOrderAsc();
    LegalGuide findTopByIsHighlightedTrue();
}