package com.road.perfectpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.service.HeroSectionService;
import com.road.perfectpro.vo.HeroSection;

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
            @RequestParam("subtitle") String subtitle,
            @RequestParam("lawyerName") String lawyerName,
            @RequestParam(value = "profileImage", required = false) MultipartFile profileImage,
            @RequestParam(value = "universityLogo", required = false) MultipartFile universityLogo,
            @RequestParam(value = "companyLogo", required = false) MultipartFile companyLogo) {
        
        HeroSection heroSection = new HeroSection();
        heroSection.setId(id);
        heroSection.setSubtitle(subtitle);
        heroSection.setLawyerName(lawyerName);
        
        heroSectionService.updateHeroSection(heroSection, profileImage, universityLogo, companyLogo);
        
        return "redirect:/admin/hero-section";
    }

    @PostMapping("/hero-section/reset")
    public String resetToDefault() {
        heroSectionService.resetToDefault();
        return "redirect:/admin/hero-section";
    }
}
