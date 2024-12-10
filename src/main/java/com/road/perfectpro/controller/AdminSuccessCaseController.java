package com.road.perfectpro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import com.road.perfectpro.service.SuccessCaseService;
import com.road.perfectpro.vo.SuccessCase;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/success-cases")
public class AdminSuccessCaseController {

    private final SuccessCaseService successCaseService;

    @GetMapping("")
    public String showSuccessCases(Model model) {
        List<SuccessCase> cases = successCaseService.getAllActiveCases();
        cases.forEach(c -> {
            if (c.getCategories() != null) {
                c.setCategoriesString(String.join(", ", c.getCategories()));
            }
        });
        model.addAttribute("successCases", cases);
        return "admin/success-case-edit";
    }

    @PostMapping("/success-cases")
    public String updateSuccessCase(@RequestParam("id") Long id,
                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                  @RequestParam("title") String title,
                                  @RequestParam("content") String content,
                                  @RequestParam("categoriesString") String categoriesString,
                                  @RequestParam("resultTitle") String resultTitle,
                                  @RequestParam("resultContent") String resultContent,
                                  @RequestParam("displayOrder") Integer displayOrder,
                                  @RequestParam(value = "isActive", defaultValue = "false") Boolean isActive) {
        
        SuccessCase successCase = new SuccessCase();
        successCase.setId(id);
        successCase.setTitle(title);
        successCase.setContent(content);
        successCase.setCategoriesString(categoriesString);
        successCase.setResultTitle(resultTitle);
        successCase.setResultContent(resultContent);
        successCase.setDisplayOrder(displayOrder);
        successCase.setIsActive(isActive);
        
        successCaseService.updateSuccessCase(successCase, imageFile);
        
        return "redirect:/admin/success-cases";
    }

    @PostMapping("/new")
    public String createCase(@ModelAttribute SuccessCase successCase, 
                           @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) {
        successCaseService.createCase(successCase, imageFile);
        return "redirect:/admin/success-cases";
    }

    @PostMapping("/delete/{id}")
    public String deleteCase(@PathVariable("id") Long id) {
        log.info("성공사례 삭제 요청 ID = {}", id);
        successCaseService.deleteCase(id);
        log.info("성공사례 삭제 완료");
        return "redirect:/admin/success-cases";
    }

    @PostMapping("/reset")
    public String resetToDefault() {
        successCaseService.resetToDefault();
        return "redirect:/admin/success-cases";
    }
}