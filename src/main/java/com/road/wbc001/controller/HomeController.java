package com.road.wbc001.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.road.wbc001.service.AboutSectionService;
import com.road.wbc001.service.HeroSectionService;
import com.road.wbc001.service.ReviewSectionService;
import com.road.wbc001.service.VideoSectionService;
import com.road.wbc001.vo.AboutSection;
import com.road.wbc001.vo.HeroSection;
import com.road.wbc001.vo.ReviewSection;
import com.road.wbc001.vo.VideoSection;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
public class HomeController {

    @Autowired
    private HeroSectionService heroSectionService;
    
    @Autowired
    private AboutSectionService aboutSectionService;

    @Autowired
    private VideoSectionService videoSectionService;
    
    @Autowired
    private ReviewSectionService reviewService;

    @GetMapping("/")
    public String home(Model model) {
        // 히어로 섹션 데이터
        HeroSection heroSection = heroSectionService.getHeroSection();
        model.addAttribute("heroSection", heroSection);
        
        // 어바웃 섹션 데이터
        AboutSection aboutSection = aboutSectionService.getAboutSection();
        model.addAttribute("aboutSection", aboutSection);

        // 비디오 섹션 데이터
        VideoSection videoSection = videoSectionService.getVideoSection();
        model.addAttribute("videoSection", videoSection);
        
        // 리뷰 섹션 데이터
        List<ReviewSection> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        
        log.info("Subtitle Line 1: {}", heroSection.getSubtitleLine1());
        log.info("Subtitle Line 2: {}", heroSection.getSubtitleLine2());
        return "main";
    }
    
    @GetMapping("/main")
    public String main(Model model) {
        // 히어로 섹션 데이터
        HeroSection heroSection = heroSectionService.getHeroSection();
        model.addAttribute("heroSection", heroSection);
        
        // 어바웃 섹션 데이터
        AboutSection aboutSection = aboutSectionService.getAboutSection();
        model.addAttribute("aboutSection", aboutSection);

        // 비디오 섹션 데이터
        VideoSection videoSection = videoSectionService.getVideoSection();
        model.addAttribute("videoSection", videoSection);
        
        // 리뷰 섹션 데이터
        List<ReviewSection> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        
        log.info("Subtitle Line 1: {}", heroSection.getSubtitleLine1());
        log.info("Subtitle Line 2: {}", heroSection.getSubtitleLine2());
        return "main";
    }
}
