package com.road.wbc001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.road.wbc001.repository.HeroSectionRepository;
import com.road.wbc001.vo.HeroSection;

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
        heroSection.setTitle("민사변호사 전문 50년 경력");
        heroSection.setSubtitleLine1("\"내 일\"이라고 생각하고");
        heroSection.setSubtitleLine2("\"내 일\"처럼 하겠습니다.");
        heroSection.setLawyerName("강진태 변호사");
        heroSection.setProfileImage("/images/통일감.png");
        heroSection.setUniversityLogo("/images/대학로고투명.png");
        heroSection.setCompanyLogo("/images/회사로고.png");
        
        return heroSectionRepository.save(heroSection);
    }

    private HeroSection createDefaultHeroSection() {
        HeroSection heroSection = new HeroSection();
        return heroSectionRepository.save(heroSection);
    }

    @Transactional
    public void updateHeroSection(HeroSection heroSection) {
        HeroSection existingSection = heroSectionRepository.findById(heroSection.getId())
                .orElseThrow(() -> new RuntimeException("히어로 섹션을 찾을 수 없습니다."));
        
        // 텍스트 필드만 업데이트
        existingSection.setTitle(heroSection.getTitle());
        existingSection.setSubtitleLine1(heroSection.getSubtitleLine1());
        existingSection.setSubtitleLine2(heroSection.getSubtitleLine2());
        existingSection.setLawyerName(heroSection.getLawyerName());
        existingSection.setUpdatedAt(LocalDateTime.now());
        
        // 이미지 필드는 유지
        heroSectionRepository.save(existingSection);
    }

    
    public HeroSection updateHeroImages(Long id, MultipartFile profileImage, 
                                      MultipartFile universityLogo, 
                                      MultipartFile companyLogo) {
        HeroSection heroSection = heroSectionRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Hero section not found"));
            
        // 이미지가 제공된 경우에만 업데이트
        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveImage(profileImage);
            if (profileImagePath != null) {
                heroSection.setProfileImage(profileImagePath);
            }
        }
        
        if (universityLogo != null && !universityLogo.isEmpty()) {
            String universityLogoPath = saveImage(universityLogo);
            if (universityLogoPath != null) {
                heroSection.setUniversityLogo(universityLogoPath);
            }
        }
        
        if (companyLogo != null && !companyLogo.isEmpty()) {
            String companyLogoPath = saveImage(companyLogo);
            if (companyLogoPath != null) {
                heroSection.setCompanyLogo(companyLogoPath);
            }
        }
        
        return heroSectionRepository.save(heroSection);
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
