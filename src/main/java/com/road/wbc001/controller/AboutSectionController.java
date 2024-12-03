package com.road.perfectpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.service.AboutSectionService;
import com.road.perfectpro.vo.AboutSection;

@Controller
@RequestMapping("/admin")
public class AboutSectionController {
    
    @Autowired
    private AboutSectionService aboutSectionService;
    
    @GetMapping("/about-section")
    public String editAboutSection(Model model) {
        AboutSection aboutSection = aboutSectionService.getAboutSection();
        model.addAttribute("aboutSection", aboutSection);
        return "admin/about-section-edit";
    }
    
    @PostMapping("/about-section")
    public String updateAboutSection(@ModelAttribute AboutSection aboutSection) {
        aboutSectionService.updateAboutSection(aboutSection);
        return "redirect:/admin/about-section";
    }
    
    @PostMapping("/about-section/images")
    public String updateImages(@RequestParam Long id,
                             @RequestParam MultipartFile profileImage,
                             @RequestParam MultipartFile signatureImage) {
        aboutSectionService.updateImages(id, profileImage, signatureImage);
        return "redirect:/admin/about-section";
    }
    
    @PostMapping("/about-section/reset")
    public String resetToDefault() {
        aboutSectionService.resetToDefault();
        return "redirect:/admin/about-section";
    }
}