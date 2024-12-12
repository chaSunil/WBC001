package com.road.perfectpro.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.service.ExpertiseService;
import com.road.perfectpro.vo.Expertise;
import com.road.perfectpro.vo.ExpertiseDetail;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import lombok.RequiredArgsConstructor;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminExpertiseController {

    private final ExpertiseService expertiseService;

    @GetMapping("/expertise")
    public String showExpertise(Model model) {
        model.addAttribute("expertiseList", expertiseService.getAllExpertise());
        return "admin/expertise-edit";
    }

    @PostMapping("/expertise")
    public String saveExpertise(@ModelAttribute Expertise expertise,
                              @RequestParam(value = "iconFile", required = false) MultipartFile iconFile,
                              @RequestParam(value = "existingIconPath", required = false) String existingIconPath) {
        try {
            if (iconFile != null && !iconFile.isEmpty()) {
                String fileName = saveFile(iconFile, "expertise");
                expertise.setIconPath("/images/expertise/" + fileName);
            } else if (existingIconPath != null) {
                expertise.setIconPath(existingIconPath);
            }
            expertiseService.saveExpertise(expertise);
            log.info("전문분야 저장 성공: {}", expertise.getMainTitle());
        } catch (IOException e) {
            log.error("파일 업로드 실패", e);
        }
        return "redirect:/admin/expertise";
    }

    @PostMapping("/expertise/detail")
    public String saveDetail(@ModelAttribute ExpertiseDetail detail) {
        try {
            expertiseService.saveDetail(detail);
            log.info("세부분야 저장 성공: {}", detail.getSubtitle());
        } catch (Exception e) {
            log.error("세부분야 저장 실패", e);
        }
        return "redirect:/admin/expertise";
    }

    @PostMapping("/expertise/delete/{id}")
    public String deleteExpertise(@PathVariable Long id) {
        expertiseService.deleteExpertise(id);
        return "redirect:/admin/expertise";
    }

    @PostMapping("/expertise/detail/delete/{id}")
    public String deleteDetail(@PathVariable Long id) {
        expertiseService.deleteDetail(id);
        return "redirect:/admin/expertise";
    }

    // 파일 저장 유틸리티 메서드
    private String saveFile(MultipartFile file, String directory) throws IOException {
        String uploadDir = "src/main/resources/static/images/" + directory;
        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        
        return fileName;
    }
} 