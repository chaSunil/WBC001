package com.road.perfectpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.road.perfectpro.service.CareerService;
import com.road.perfectpro.service.CareerCategoryService;
import com.road.perfectpro.vo.Career;
import com.road.perfectpro.vo.CareerCategory;

import java.util.Map;
import java.util.List;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Controller
@RequestMapping("/admin")
public class AdminCareerController {

    @Autowired
    private CareerService careerService;
    
    @Autowired
    private CareerCategoryService categoryService;

    @GetMapping("/careers")
    public String showEditForm(Model model) {
        Map<CareerCategory, List<Career>> careersByCategory = careerService.getAllCareersForAdmin();
        List<CareerCategory> categories = categoryService.getAllActiveCategories();
        model.addAttribute("careersByCategory", careersByCategory);
        model.addAttribute("categories", categories);
        model.addAttribute("newCareer", new Career());
        return "admin/career-edit";
    }

    @PostMapping("/careers/category")
    @ResponseBody
    public ResponseEntity<?> createCategory(@RequestBody CareerCategory category) {
        try {
            CareerCategory saved = categoryService.createCategory(category);
            return ResponseEntity.ok(saved);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(Map.of("error", e.getMessage()));
        }
    }

    @PostMapping("/careers/category/update")
    @ResponseBody
    public ResponseEntity<?> updateCategory(@RequestBody Map<String, String> payload) {
        try {
            String oldName = payload.get("oldTitle");
            String newName = payload.get("newTitle");
            String newIcon = payload.get("newIcon");
            careerService.updateCategoryTitle(oldName, newName, newIcon);
            return ResponseEntity.ok(Map.of("success", true));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(Map.of("error", e.getMessage()));
        }
    }

    // @DeleteMapping 대신 @PostMapping 사용
    @PostMapping("/careers/category/delete/{categoryId}")
    public String deleteCategory(@PathVariable("categoryId") Long categoryId) {
        try {
            categoryService.deleteCategory(categoryId);
            return "redirect:/admin/careers";
        } catch (Exception e) {
            return "redirect:/admin/careers?error=" + URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8);
        }
    }
    
    @PostMapping("/careers/{id}")
    public String updateCareer(@PathVariable("id") Long id, @ModelAttribute Career career) {
        careerService.updateCareer(id, career);
        return "redirect:/admin/careers";
    }

    @PostMapping("/careers")
    public String createCareer(Career career) {
        careerService.createCareer(career);
        return "redirect:/admin/careers";
    }

    @PostMapping("/careers/delete/{id}")
    public String deleteCareer(@PathVariable Long id) {
        careerService.deleteCareer(id);
        return "redirect:/admin/careers";
    }

    @PostMapping("/careers/{id}/toggle-active")
    @ResponseBody
    public boolean toggleActive(@PathVariable Long id) {
        Career career = careerService.toggleCareerActive(id);
        return career.getIsActive();
    }

    @GetMapping("/careers/preview")
    public String previewCareers(Model model) {
        Map<CareerCategory, List<Career>> careersByCategory = careerService.getAllCareersForAdmin();
        model.addAttribute("careersByCategory", careersByCategory);
        return "admin/career-preview";
    }

    @PostMapping("/careers/preview")
    public String previewCareerChanges(@ModelAttribute Career career, Model model) {
        Map<CareerCategory, List<Career>> previewData = careerService.getPreviewData(career);
        model.addAttribute("careersByCategory", previewData);
        return "admin/career-preview";
    }
} 