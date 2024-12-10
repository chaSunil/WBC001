package com.road.perfectpro.controller;

import com.road.perfectpro.service.FAQService;
import com.road.perfectpro.vo.FAQ;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminFAQController {

    private final FAQService faqService;
    
    @GetMapping("/faqs")
    public String showFAQs(Model model) {
        model.addAttribute("faqs", faqService.getAllFAQs());
        return "admin/faq-edit";
    }
    
    @PostMapping("/faqs")
    public String updateFAQ(@ModelAttribute FAQ faq) {
        faqService.updateFAQ(faq);
        return "redirect:/admin/faqs";
    }
    
    @PostMapping("/faqs/new")
    public String createFAQ(@ModelAttribute FAQ faq) {
        faqService.createFAQ(faq);
        return "redirect:/admin/faqs";
    }
    
    @PostMapping("/faqs/delete/{id}")
    public String deleteFAQ(@PathVariable("id") Long id) {
        faqService.deleteFAQ(id);
        return "redirect:/admin/faqs";
    }
} 