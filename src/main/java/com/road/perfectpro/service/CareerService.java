package com.road.perfectpro.service;

import com.road.perfectpro.vo.Career;
import com.road.perfectpro.vo.CareerCategory;
import com.road.perfectpro.repository.CareerRepository;
import com.road.perfectpro.repository.CareerCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.LinkedHashMap;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CareerService {

    private final CareerRepository careerRepository;
    private final CareerCategoryRepository categoryRepository;

    // 모든 활성화된 경력을 카테고리별로 그룹화하여 조회
    public Map<String, List<Career>> getAllActiveCareersByCategory() {
        List<Career> allCareers = careerRepository.findByIsActiveTrueOrderByDisplayOrderAsc();
        return allCareers.stream()
                .collect(Collectors.groupingBy(career -> career.getCategory().getName()));
    }

    // 특정 카테고리의 경력 목록 조회
    public List<Career> getCareersByCategory(String categoryName) {
        CareerCategory category = categoryRepository.findByName(categoryName);
        return careerRepository.findByCategoryAndIsActiveTrueOrderByDisplayOrderAsc(category);
    }

    // 새로운 경력 추가
    @Transactional
    public Career createCareer(Career career) {
        if (career.getDisplayOrder() == null) {
            Integer maxOrder = careerRepository.findMaxDisplayOrderByCategory(career.getCategory());
            career.setDisplayOrder(maxOrder != null ? maxOrder + 1 : 1);
        }
        return careerRepository.save(career);
    }

    // 경력 정보 수정
    @Transactional
    public Career updateCareer(Long id, Career careerDetails) {
        Career career = careerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("경력 정보를 찾을 수 없습니다: " + id));
        
        career.setCategory(careerDetails.getCategory());
        career.setStartYear(careerDetails.getStartYear());
        career.setEndYear(careerDetails.getEndYear());
        career.setOrganization(careerDetails.getOrganization());
        career.setPosition(careerDetails.getPosition());
        career.setDisplayOrder(careerDetails.getDisplayOrder());
        career.setIsActive(careerDetails.getIsActive());
        
        return careerRepository.save(career);
    }

    // 경력 삭제 (실제 삭제가 아닌 비활성화)
    @Transactional
    public void deleteCareer(Long id) {
        Career career = careerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("경력 정보를 찾을 수 없습니다: " + id));
        career.setIsActive(false);
        careerRepository.save(career);
    }

    // 관리자용 - 모든 경력을 카테고리별로 그룹화
    public Map<CareerCategory, List<Career>> getAllCareersForAdmin() {
        List<CareerCategory> categories = categoryRepository.findAll();
        Map<CareerCategory, List<Career>> careersByCategory = new LinkedHashMap<>();
        
        for (CareerCategory category : categories) {
            List<Career> careers = careerRepository.findByCategoryOrderByDisplayOrderAsc(category);
            careersByCategory.put(category, careers);
        }
        
        return careersByCategory;
    }

    // 활성화 상태 토글
    @Transactional
    public Career toggleCareerActive(Long id) {
        Career career = careerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("경력 정보를 찾을 수 없습니다: " + id));
        career.setIsActive(!career.getIsActive());
        return careerRepository.save(career);
    }

    // 카테고리 이름 변경
    @Transactional
    public void updateCategoryTitle(String oldName, String newName, String newIcon) {
        CareerCategory category = categoryRepository.findByName(oldName);
        if (category != null) {
            category.setName(newName);
            category.setIcon(newIcon);
            categoryRepository.save(category);
        }
    }

    public Map<CareerCategory, List<Career>> getPreviewData(Career updatedCareer) {
        Map<CareerCategory, List<Career>> currentData = getAllCareersForAdmin();
        
        // 임시로 변경사항 적용
        if (updatedCareer != null && updatedCareer.getId() != null) {
            currentData.forEach((category, careers) -> {
                careers.stream()
                      .filter(c -> c.getId().equals(updatedCareer.getId()))
                      .findFirst()
                      .ifPresent(c -> {
                          c.setOrganization(updatedCareer.getOrganization());
                          c.setPosition(updatedCareer.getPosition());
                          c.setStartYear(updatedCareer.getStartYear());
                          c.setEndYear(updatedCareer.getEndYear());
                          c.setIsActive(updatedCareer.getIsActive());
                      });
            });
        }
        
        return currentData;
    }
} 