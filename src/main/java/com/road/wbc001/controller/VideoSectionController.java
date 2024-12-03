package com.road.wbc001.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.road.wbc001.service.VideoSectionService;
import com.road.wbc001.vo.VideoSection;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class VideoSectionController {
    
    @Autowired
    private VideoSectionService videoSectionService;
    
    @GetMapping("/video-section")
    public String editVideoSection(Model model) {
        VideoSection videoSection = videoSectionService.getVideoSection();
        log.info("비디오 섹션 데이터: {}", videoSection);
        log.info("비디오 목록: {}", videoSection.getVideos());
        
        model.addAttribute("videoSection", videoSection);
        return "admin/video-section-edit";
    }
    
    @PostMapping("/video-section")
    public String updateVideoSection(@ModelAttribute VideoSection videoSection) {
        try {
            videoSectionService.save(videoSection);
            return "redirect:/admin/video-section";
        } catch (Exception e) {
            log.error("비디오 섹션 저장 중 오류 발생: ", e);
            return "redirect:/admin/video-section?error=true";
        }
    }
    
    @PostMapping("/video-section/reset")
    public String resetVideoSection() {
        videoSectionService.resetToDefault();
        return "redirect:/admin/video-section";
    }
} 