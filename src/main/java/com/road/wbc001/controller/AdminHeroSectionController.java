package com.road.wbc001.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.road.wbc001.service.HeroSectionService;
import com.road.wbc001.vo.HeroSection;

@Controller
@RequestMapping("/admin")
public class AdminHeroSectionController {

    @Autowired
    private HeroSectionService heroSectionService;

    @GetMapping("/hero-section")
    public String showEditForm(Model model) {
        HeroSection heroSection = heroSectionService.getHeroSection();
        model.addAttribute("heroSection", heroSection);
        return "admin/hero-section-edit";
    }

    @PostMapping("/hero-section")
    public String updateHeroSection(
            @RequestParam("id") Long id,
            @RequestParam("title") String title,
            @RequestParam("subtitleLine1") String subtitleLine1,
            @RequestParam("subtitleLine2") String subtitleLine2,
            @RequestParam("lawyerName") String lawyerName) {
        
        HeroSection heroSection = new HeroSection();
        heroSection.setId(id);
        heroSection.setTitle(title);
        heroSection.setSubtitleLine1(subtitleLine1);
        heroSection.setSubtitleLine2(subtitleLine2);
        heroSection.setLawyerName(lawyerName);
        
        heroSectionService.updateHeroSection(heroSection);
        
        return "redirect:/admin/hero-section";
    }

    @PostMapping("/hero-section/reset")
    public String resetToDefault() {
        heroSectionService.resetToDefault();
        return "redirect:/admin/hero-section";
    }

    @PostMapping("/hero-section/images")
    public String updateImages(@RequestParam("id") Long id,
                             @RequestParam("profileImage") MultipartFile profileImage,
                             @RequestParam("universityLogo") MultipartFile universityLogo,
                             @RequestParam("companyLogo") MultipartFile companyLogo) {
        
        heroSectionService.updateHeroImages(id, profileImage, universityLogo, companyLogo);
        return "redirect:/admin/hero-section";
    }
}
