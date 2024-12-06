package com.road.perfectpro.service;

import com.road.perfectpro.dto.LawyerCareerDTO;
import com.road.perfectpro.dto.LawyerProfileDTO;
import com.road.perfectpro.repository.LawyerCareerRepository;
import com.road.perfectpro.repository.LawyerProfileRepository;
import com.road.perfectpro.vo.LawyerCareer;
import com.road.perfectpro.vo.LawyerProfile;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class LawyerProfileService {
    
    private final LawyerProfileRepository lawyerProfileRepository;
    private final LawyerCareerRepository lawyerCareerRepository;

    public LawyerProfileDTO getLawyerProfile() {
        LawyerProfile profile = lawyerProfileRepository.findFirstByOrderByIdDesc()
                .orElseGet(() -> createDefaultProfile());
        return convertToDTO(profile);
    }

    private LawyerProfile createDefaultProfile() {
        LawyerProfile profile = new LawyerProfile();
        profile.setName("최선 변호사");
        profile.setSubtitle1("민사전문");
        profile.setSubtitle2("대한변호사협회");
        profile.setProfileImage("/images/변호사.png");
        profile.setSignatureImage("/images/싸인.png");
        profile.setSignatureName("변호사 최 선");
        profile.setGreetingContent(
            "저는 다양한 사건을 통해 쌓아 경험과 노하우로 객님의 법적 문제를 신속하고 정확하게 해결해 드리는 것을 목표로 하고 있습니다.\n\n" +
            "모든 사건은 각자의 소중한 인생이 걸린 문제라고 생각하며, 철저한 분석과 꼼꼼한 준비로 고객님의 권리를 끝까지 지켜드리겠습니다.\n\n" +
            "어려운 법률 문제도 함께라면 해결의 길을 찾을 수 있습니다. 작은 상담이라도 편하게 문의 주세요. 언제나 고객님의 입장에서 최선의 방안을 제시하겠습니다."
        );

        // 기본 경력 추가
        List<LawyerCareer> careers = new ArrayList<>();
        addCareer(careers, profile, "법무법인 WBC 변호사", "2020 - 현재", 1);
        addCareer(careers, profile, "서울중앙지방법원 부장판사", "2015 - 2020", 2);
        addCareer(careers, profile, "사법연수원 교수", "2013 - 2015", 3);
        addCareer(careers, profile, "인천지방법원 부장판사", "2010 - 2013", 4);

        profile.setCareers(careers);
        return lawyerProfileRepository.save(profile);
    }

    private void addCareer(List<LawyerCareer> careers, LawyerProfile profile, 
                          String title, String period, int order) {
        LawyerCareer career = new LawyerCareer();
        career.setCareerTitle(title);
        career.setPeriod(period);
        career.setDisplayOrder(order);
        profile.addCareer(career);
        careers.add(career);
    }

    @Transactional
    public LawyerProfileDTO saveLawyerProfile(LawyerProfileDTO dto) {
        LawyerProfile profile = new LawyerProfile();
        if (dto.getId() != null) {
            profile = lawyerProfileRepository.findById(dto.getId())
                .orElseThrow(() -> new EntityNotFoundException("변호사 프로필을 찾을 수 없습니다."));
        }
        
        updateProfileFromDTO(profile, dto);
        
        // 경력 정보 저장 - 여기를 수정
        if (dto.getCareers() != null && !dto.getCareers().isEmpty()) {
            List<LawyerCareer> careers = new ArrayList<>();
            for (int i = 0; i < dto.getCareers().size(); i++) {
                LawyerCareerDTO careerDTO = dto.getCareers().get(i);
                LawyerCareer career = new LawyerCareer();
                career.setCareerTitle(careerDTO.getCareerTitle());
                career.setPeriod(careerDTO.getPeriod());
                career.setDisplayOrder(i);
                career.setLawyerProfile(profile);
                careers.add(career);
            }
            profile.setCareers(careers);
        }
        
        LawyerProfile savedProfile = lawyerProfileRepository.save(profile);
        return convertToDTO(savedProfile);
    }

    private void updateProfileFromDTO(LawyerProfile profile, LawyerProfileDTO dto) {
        profile.setName(dto.getName());
        profile.setProfileImage(dto.getProfileImage());
        profile.setSubtitle1(dto.getSubtitle1());
        profile.setSubtitle2(dto.getSubtitle2());
        profile.setGreetingContent(dto.getGreetingContent());
        profile.setSignatureName(dto.getSignatureName());
        profile.setSignatureImage(dto.getSignatureImage());
    }

    private LawyerProfileDTO convertToDTO(LawyerProfile profile) {
        return LawyerProfileDTO.builder()
            .id(profile.getId())
            .name(profile.getName())
            .profileImage(profile.getProfileImage())
            .subtitle1(profile.getSubtitle1())
            .subtitle2(profile.getSubtitle2())
            .greetingContent(profile.getGreetingContent())
            .signatureName(profile.getSignatureName())
            .signatureImage(profile.getSignatureImage())
            .careers(profile.getCareers().stream()
                .map(this::convertToCareerDTO)
                .collect(Collectors.toList()))
            .build();
    }

    private LawyerCareerDTO convertToCareerDTO(LawyerCareer career) {
        return LawyerCareerDTO.builder()
            .id(career.getId())
            .careerTitle(career.getCareerTitle())
            .period(career.getPeriod())
            .build();
    }

    @Transactional
    public void updateProfileImages(Long id, MultipartFile profileImage, MultipartFile signatureImage) {
        LawyerProfile profile = lawyerProfileRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("변호사 프로필을 찾을 수 없습니다."));

        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveFile(profileImage, "profile");
            profile.setProfileImage(profileImagePath);
        }

        if (signatureImage != null && !signatureImage.isEmpty()) {
            String signatureImagePath = saveFile(signatureImage, "signature");
            profile.setSignatureImage(signatureImagePath);
        }

        lawyerProfileRepository.save(profile);
    }

    private String saveFile(MultipartFile file, String prefix) {
        try {
            String uploadDir = "src/main/resources/static/images/";
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

    public LawyerProfile findById(Long id) {
        return lawyerProfileRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("변호사 프로필을 찾을 수 없습니다."));
    }
}