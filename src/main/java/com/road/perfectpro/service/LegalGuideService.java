package com.road.perfectpro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

import com.road.perfectpro.repository.LegalGuideRepository;
import com.road.perfectpro.vo.LegalGuide;
import java.util.List;

@Slf4j
@Service
public class LegalGuideService {

    private final LegalGuideRepository legalGuideRepository;

    @Autowired
    public LegalGuideService(LegalGuideRepository legalGuideRepository) {
        this.legalGuideRepository = legalGuideRepository;
    }

    public List<LegalGuide> getAllGuides() {
        log.info("서비스: 모든 법률가이드 조회");
        return legalGuideRepository.findAllByOrderByDisplayOrderAsc();
    }

    public List<LegalGuide> getActiveGuides() {
        return legalGuideRepository.findByIsActiveTrueOrderByDisplayOrderAsc();
    }

    public LegalGuide getHighlightedGuide() {
        return legalGuideRepository.findTopByIsHighlightedTrue();
    }

    public LegalGuide getGuide(Long id) {
        log.info("서비스: 법률가이드 조회 ID = {}", id);
        return legalGuideRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("법률가이드를 찾을 수 없습니다: " + id));
    }

    @Transactional
    public void createGuide(LegalGuide guide) {
        log.info("서비스: 새 법률가이드 생성");
        legalGuideRepository.save(guide);
    }

    @Transactional
    public void updateGuide(LegalGuide guide) {
        log.info("서비스: 법률가이드 업데이트 ID = {}", guide.getId());
        LegalGuide existingGuide = getGuide(guide.getId());
        
        existingGuide.setCategory(guide.getCategory());
        existingGuide.setTitle(guide.getTitle());
        existingGuide.setContent(guide.getContent());
        existingGuide.setSource(guide.getSource());
        existingGuide.setLink(guide.getLink());
        existingGuide.setIsHighlighted(guide.getIsHighlighted());
        existingGuide.setIsActive(guide.getIsActive());
        existingGuide.setDisplayOrder(guide.getDisplayOrder());
        
        legalGuideRepository.save(existingGuide);
        log.info("서비스: 법률가이드 업데이트 완료");
    }

    @Transactional
    public void deleteGuide(Long id) {
        log.info("서비스: 법률가이드 삭제 ID = {}", id);
        legalGuideRepository.deleteById(id);
        log.info("서비스: 법률가이드 삭제 완료");
    }
}