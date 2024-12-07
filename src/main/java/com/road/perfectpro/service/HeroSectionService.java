package com.road.perfectpro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.repository.HeroSectionRepository;
import com.road.perfectpro.vo.HeroSection;

import java.time.LocalDateTime;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
@Transactional
public class HeroSectionService {

    @Autowired
    private HeroSectionRepository heroSectionRepository;

    public HeroSection getHeroSection() {
        return heroSectionRepository.findFirstByOrderByIdDesc()
                .orElseGet(() -> {
                    HeroSection defaultSection = new HeroSection();
                    return heroSectionRepository.save(defaultSection);
                });
    }

    public HeroSection resetToDefault() {
        HeroSection heroSection = heroSectionRepository.findFirstByOrderByIdDesc()
                .orElseGet(() -> new HeroSection());
            
        // 기본값으로 리셋
        heroSection.setSubtitle("\"내 일\"이라고 생각하고 \"내 일\"처럼 하겠습니다.");
        heroSection.setLawyerName("최선 변호사");
        heroSection.setProfileImage("/images/변호사.png");
        heroSection.setUniversityLogo("/images/대학로고투명.png");
        heroSection.setCompanyLogo("/images/회사로고.png");
        
        return heroSectionRepository.save(heroSection);
    }

    @Transactional
    public void updateHeroSection(HeroSection heroSection, 
                                MultipartFile profileImage,
                                MultipartFile universityLogo,
                                MultipartFile companyLogo) {
        HeroSection existingSection = heroSectionRepository.findById(heroSection.getId())
                .orElseThrow(() -> new RuntimeException("히어로 섹션을 찾을 수 없습니다."));
        
        // 텍스트 필드 업데이트
        existingSection.setSubtitle(heroSection.getSubtitle());
        existingSection.setLawyerName(heroSection.getLawyerName());
        existingSection.setUpdatedAt(LocalDateTime.now());
        
        // 이미지 업데이��
        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveImage(profileImage);
            if (profileImagePath != null) {
                existingSection.setProfileImage(profileImagePath);
            }
        }
        
        if (universityLogo != null && !universityLogo.isEmpty()) {
            String universityLogoPath = saveImage(universityLogo);
            if (universityLogoPath != null) {
                existingSection.setUniversityLogo(universityLogoPath);
            }
        }
        
        if (companyLogo != null && !companyLogo.isEmpty()) {
            String companyLogoPath = saveImage(companyLogo);
            if (companyLogoPath != null) {
                existingSection.setCompanyLogo(companyLogoPath);
            }
        }
        
        heroSectionRepository.save(existingSection);
    }
    
    private String saveImage(MultipartFile file) {
        try {
            // 실제 파일 저장 경로 설정
            String uploadDir = "src/main/resources/static/images/";
            String fileName = file.getOriginalFilename();
            Path path = Paths.get(uploadDir + fileName);
            
            // 디렉토리가 없으면 생성
            Files.createDirectories(path.getParent());
            
            // 파일 저장
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            
            // 웹에서 접근 가능한 경로 반환
            return "/images/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
