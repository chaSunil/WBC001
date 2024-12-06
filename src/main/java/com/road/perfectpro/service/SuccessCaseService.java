package com.road.perfectpro.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import lombok.RequiredArgsConstructor;
import java.util.List;
import java.util.Arrays;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;
import java.util.stream.Collectors;

import com.road.perfectpro.repository.SuccessCaseRepository;
import com.road.perfectpro.vo.SuccessCase;

@Service
@Transactional
@RequiredArgsConstructor
public class SuccessCaseService {
    
    private final SuccessCaseRepository successCaseRepository;
    
    public List<SuccessCase> getAllActiveCases() {
        return successCaseRepository.findAllByIsActiveTrueOrderByDisplayOrderAsc();
    }
    
    @Transactional
    public SuccessCase createCase(SuccessCase successCase, MultipartFile image) {
        if (image != null && !image.isEmpty()) {
            String imagePath = saveImage(image);
            successCase.setImageUrl(imagePath);
        }
        return successCaseRepository.save(successCase);
    }

    @Transactional
    public void resetToDefault() {
        successCaseRepository.deleteAll();
        
        // 기본 성공사례 생성
        SuccessCase case1 = new SuccessCase();
        case1.setCategories(Arrays.asList("민사소송", "임대차분쟁", "보증금반환"));
        case1.setTitle("임대차보증금 반환 청구 승소");
        case1.setContent("임대인의 보증금 반환 거부에 대해 적극 대응하여 전액 승소 판결을 이어냈습니다.");
        case1.setImageUrl("/images/case1.jpg");
        case1.setResultTitle("결과: 전액 승소 판결");
        case1.setResultContent("의뢰인 권리 100% 회복");
        case1.setDisplayOrder(1);
        
        successCaseRepository.save(case1);
        // ... 다른 기본 케이스들도 추가
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

    @Transactional
    public void updateSuccessCase(SuccessCase updatedCase, MultipartFile imageFile) {
        SuccessCase existingCase = successCaseRepository.findById(updatedCase.getId())
                .orElseThrow(() -> new RuntimeException("성공사례를 찾을 수 없습니다."));
        
        // 이미지 처리
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
                Path uploadPath = Paths.get("src/main/resources/static/images/");
                
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                
                // 기존 이미지 삭제
                if (existingCase.getImageUrl() != null) {
                    String oldFileName = existingCase.getImageUrl().substring(existingCase.getImageUrl().lastIndexOf("/") + 1);
                    Path oldFilePath = uploadPath.resolve(oldFileName);
                    Files.deleteIfExists(oldFilePath);
                }
                
                // 새 이미지 저장
                Files.copy(imageFile.getInputStream(), 
                          uploadPath.resolve(fileName),
                          StandardCopyOption.REPLACE_EXISTING);
                
                existingCase.setImageUrl("/images/" + fileName);
            } catch (IOException e) {
                throw new RuntimeException("이미지 저장 중 오류가 발생했습니다.", e);
            }
        }
        
        // 카테고리 처리
        if (updatedCase.getCategoriesString() != null) {
            List<String> categories = Arrays.asList(
                updatedCase.getCategoriesString().split(","))
                .stream()
                .map(String::trim)
                .collect(Collectors.toList());
            existingCase.setCategories(categories);
        }
        
        // 나머지 필드 업데이트
        existingCase.setTitle(updatedCase.getTitle());
        existingCase.setContent(updatedCase.getContent());
        existingCase.setResultTitle(updatedCase.getResultTitle());
        existingCase.setResultContent(updatedCase.getResultContent());
        existingCase.setDisplayOrder(updatedCase.getDisplayOrder());
        existingCase.setIsActive(updatedCase.getIsActive());
        
        successCaseRepository.save(existingCase);
    }
}