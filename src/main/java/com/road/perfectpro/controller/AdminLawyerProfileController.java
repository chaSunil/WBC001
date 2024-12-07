package com.road.perfectpro.controller;

import com.road.perfectpro.dto.LawyerCareerDTO;
import com.road.perfectpro.dto.LawyerProfileDTO;
import com.road.perfectpro.service.LawyerProfileService;
import com.road.perfectpro.vo.LawyerProfile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminLawyerProfileController {

    private final LawyerProfileService lawyerProfileService;

    @GetMapping("/lawyer-profile")
    public String showEditForm(Model model) {
        LawyerProfileDTO profile = lawyerProfileService.getLawyerProfile();
        model.addAttribute("profile", profile);
        return "admin/lawyer-profile-edit";
    }

    @PostMapping("/lawyer-profile")
    public String updateLawyerProfile(
            @RequestParam("id") Long id,
            @RequestParam("name") String name,
            @RequestParam("subtitle1") String subtitle1,
            @RequestParam("subtitle2") String subtitle2,
            @RequestParam("greetingContent") String greetingContent,
            @RequestParam("signatureName") String signatureName,
            @RequestParam(value = "profileImage", required = false) MultipartFile profileImage,
            @RequestParam(value = "signatureImage", required = false) MultipartFile signatureImage,
            @RequestParam(value = "careers", required = false) List<String> careerTitles,
            @RequestParam(value = "careers", required = false) List<String> careerPeriods) {
        
        // 줄바꿈 문자(\r\n 또는 \n)를 <br> 태그로 변환
        String formattedGreeting = greetingContent.replaceAll("(\r\n|\n)", "<br>");
        
        // 기존 프로필 정보 가져오기
        LawyerProfile existingProfile = lawyerProfileService.findById(id);
        
        List<LawyerCareerDTO> careerDTOs = new ArrayList<>();
        if (careerTitles != null) {
            for (int i = 0; i < careerTitles.size(); i += 2) {
                careerDTOs.add(LawyerCareerDTO.builder()
                    .careerTitle(careerTitles.get(i))
                    .period(careerTitles.get(i + 1))
                    .build());
            }
        }

        LawyerProfileDTO dto = LawyerProfileDTO.builder()
            .id(id)
            .name(name)
            .subtitle1(subtitle1)
            .subtitle2(subtitle2)
            .greetingContent(formattedGreeting)
            .signatureName(signatureName)
            .profileImage(existingProfile.getProfileImage())
            .signatureImage(existingProfile.getSignatureImage())
            .careers(careerDTOs)
            .build();

        // 새로운 이미지가 업로드된 경우에만 처리
        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveFile(profileImage, "profile");
            dto.setProfileImage(profileImagePath);
        }
        
        if (signatureImage != null && !signatureImage.isEmpty()) {
            String signatureImagePath = saveFile(signatureImage, "signature");
            dto.setSignatureImage(signatureImagePath);
        }
        
        lawyerProfileService.saveLawyerProfile(dto);
        return "redirect:/admin/lawyer-profile";
    }

    private String saveFile(MultipartFile file, String prefix) {
        try {
            // 프로젝트 루트 디렉토리 가져오기
            String projectDir = System.getProperty("user.dir");
            String uploadDir = projectDir + "/src/main/resources/static/images/";
            String fileName = prefix + "_" + System.currentTimeMillis() + "_" + 
                            file.getOriginalFilename();
            
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }
            
            File dest = new File(uploadPath + File.separator + fileName);
            file.transferTo(dest);
            
            return "/images/" + fileName;
        } catch (IOException e) {
            throw new RuntimeException("파일 저장 실패: " + e.getMessage());
        }
    }
}