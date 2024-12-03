package com.road.perfectpro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.repository.AboutSectionRepository;
import com.road.perfectpro.vo.AboutSection;
import com.road.perfectpro.vo.Career;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

@Service
public class AboutSectionService {

    @Autowired
    private AboutSectionRepository aboutSectionRepository;

    public AboutSection getAboutSection() {
        return aboutSectionRepository.findAll()
                .stream()
                .findFirst()
                .orElseGet(this::createDefaultAboutSection);
    }

    @Transactional
    public AboutSection resetToDefault() {
        AboutSection aboutSection = aboutSectionRepository.findAll()
                .stream()
                .findFirst()
                .orElseGet(() -> new AboutSection());
            
        // 기본으로 리셋
        aboutSection.setLawyerName("최선 변호사");
        aboutSection.setSpecialty("민사전문");
        aboutSection.setAssociation("대한변호사협회");
        aboutSection.setGreeting("저는 다양한 사건을 통해 쌓아 경험과 노하우로 고객님의 법적 문제를 신속하고 정확하게 해결해 드리는 것을 목표로 하고 있습니다...");
        aboutSection.setProfileImage("/images/대표통일감.jpg");
        aboutSection.setSignatureImage("/images/싸인.png");
        
        return aboutSectionRepository.save(aboutSection);
    }

    @Transactional
    public void updateAboutSection(AboutSection aboutSection) {
        AboutSection existingSection = aboutSectionRepository.findById(aboutSection.getId())
                .orElseThrow(() -> new RuntimeException("About 섹션을 찾을 수 없습니다."));
        
        existingSection.setLawyerName(aboutSection.getLawyerName());
        existingSection.setSpecialty(aboutSection.getSpecialty());
        existingSection.setAssociation(aboutSection.getAssociation());
        existingSection.setGreeting(aboutSection.getGreeting());
        
        // careers 컬렉션 업데이트
        existingSection.getCareers().clear(); // 기존 경력 모두 제거
        if (aboutSection.getCareers() != null) {
            aboutSection.getCareers().forEach(career -> {
                career.setAboutSection(existingSection); // 양방향 관계 설정
                existingSection.getCareers().add(career);
            });
        }
        
        aboutSectionRepository.save(existingSection);
    }

    @Transactional
    public void updateImages(Long id, MultipartFile profileImage, MultipartFile signatureImage) {
        AboutSection aboutSection = aboutSectionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("About 섹션을 찾을 수 없습니다."));

        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveImage(profileImage);
            if (profileImagePath != null) {
                aboutSection.setProfileImage(profileImagePath);
            }
        }

        if (signatureImage != null && !signatureImage.isEmpty()) {
            String signatureImagePath = saveImage(signatureImage);
            if (signatureImagePath != null) {
                aboutSection.setSignatureImage(signatureImagePath);
            }
        }

        aboutSectionRepository.save(aboutSection);
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

    private AboutSection createDefaultAboutSection() {
        AboutSection aboutSection = new AboutSection();
        aboutSection.setLawyerName("최선 변호사");
        aboutSection.setSpecialty("민사전문");
        aboutSection.setAssociation("대한변호사협회");
        aboutSection.setGreeting("저는 다양한 사건을 통해 쌓아 경험과 노하우로 객님의 법적 문제를 신속하고 정확하게 해결해 드리는 것을 목표로 하고 있습니다.\n\n" +
                               "모든 사건은 각자의 소중한 인생이 걸린 문제라고 생각하며, 철저한 분석과 꼼꼼한 준비로 고님의 권리를 끝까지 지켜드리겠습니다.\n\n" +
                               "어려운 법률 문제도 함께라면 해결의 길을 찾을 수 있습니다. 작은 상담이라도 편하게 문의 주세요. 언제나 고객님의 입장에서 최선의 방안을 제시하겠습니다.");
        aboutSection.setProfileImage("/images/대표통일감.jpg");
        aboutSection.setSignatureImage("/images/싸인.png");
        
        // 기본 경력 추가
        List<Career> careers = new ArrayList<>();
        
        Career career1 = new Career();
        career1.setTitle("법무법인 다래 변호사");
        career1.setPeriod("2020 - 현재");
        career1.setAboutSection(aboutSection);
        careers.add(career1);
        
        Career career2 = new Career();
        career2.setTitle("서울중앙지방법원 부장판사");
        career2.setPeriod("2015 - 2020");
        career2.setAboutSection(aboutSection);
        careers.add(career2);
        
        Career career3 = new Career();
        career3.setTitle("사법연수원 교수");
        career3.setPeriod("2013 - 2015");
        career3.setAboutSection(aboutSection);
        careers.add(career3);
        
        Career career4 = new Career();
        career4.setTitle("인천지방법원 부장판사");
        career4.setPeriod("2010 - 2013");
        career4.setAboutSection(aboutSection);
        careers.add(career4);
        
        aboutSection.setCareers(careers);
        
        return aboutSectionRepository.save(aboutSection);
    }
}