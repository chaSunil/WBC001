package com.road.perfectpro.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.road.perfectpro.service.LegalGuideService;
import com.road.perfectpro.vo.LegalGuide;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminLegalGuideController {

    @Autowired
    private LegalGuideService legalGuideService;

    @GetMapping("/legal-guides")
    public String showLegalGuides(Model model) {
        log.info("컨트롤러: 법률가이드 목록 조회");
        model.addAttribute("legalGuides", legalGuideService.getAllGuides());
        return "admin/legal-guide-edit";
    }

    @PostMapping("/legal-guides")
    public String updateLegalGuide(@ModelAttribute("guide") LegalGuide guide) {
        log.info("컨트롤러: 법률가이드 요청 ID = {}", guide.getId());
        
        if (guide.getId() == null) {
            // 새 가이드 추가
            log.info("컨트롤러: 새 법률가이드 추가");
            legalGuideService.createGuide(guide);
        } else {
            // 기존 가이드 수정
            LegalGuide existingGuide = legalGuideService.getGuide(guide.getId());
            
            // 날짜가 null이 아닌 경우에만 업데이트
            if (guide.getDate() != null) {
                existingGuide.setDate(guide.getDate());
            }
            
            // 나머지 필드 업데이트
            existingGuide.setCategory(guide.getCategory());
            existingGuide.setTitle(guide.getTitle());
            existingGuide.setContent(guide.getContent());
            existingGuide.setSource(guide.getSource());
            existingGuide.setLink(guide.getLink());
            existingGuide.setIsHighlighted(guide.getIsHighlighted());
            existingGuide.setIsActive(guide.getIsActive());
            existingGuide.setDisplayOrder(guide.getDisplayOrder());
            
            legalGuideService.updateGuide(existingGuide);
            log.info("컨트롤러: 법률가이드 업데이트 완료");
        }
        
        return "redirect:/admin/legal-guides";
    }

    @PostMapping("/legal-guides/new")
    public String createLegalGuide(@ModelAttribute LegalGuide guide) {
        log.info("컨트롤러: 새 법률가이드 생성 요청");
        
        // 새 가이드 생성
        legalGuideService.createGuide(guide);
        log.info("컨트롤러: 새 법률가이드 생성 완료");
        
        return "redirect:/admin/legal-guides";
    }

    @PostMapping("/legal-guides/delete/{id}")
    public String deleteLegalGuide(@PathVariable("id") Long id) {
        log.info("컨트롤러: 법률가이드 삭제 요청 ID = {}", id);
        legalGuideService.deleteGuide(id);
        log.info("컨트롤러: 법률가이드 삭제 완료");
        return "redirect:/admin/legal-guides";
    }
}