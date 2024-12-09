package com.road.perfectpro.service;

import com.road.perfectpro.vo.CareerCategory;
import com.road.perfectpro.repository.CareerCategoryRepository;
import com.road.perfectpro.repository.CareerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CareerCategoryService {

    @Autowired
    private CareerCategoryRepository categoryRepository;

    @Autowired
    private CareerRepository careerRepository;

    // 모든 활성화된 카테고리 조회
    public List<CareerCategory> getAllActiveCategories() {
        return categoryRepository.findByIsActiveTrueOrderByDisplayOrderAsc();
    }

    // 새로운 카테고리 생성
    @Transactional
    public CareerCategory createCategory(CareerCategory category) {
        if (category.getDisplayOrder() == null) {
            long count = categoryRepository.count();
            category.setDisplayOrder((int) count + 1);
        }
        return categoryRepository.save(category);
    }

    // 카테고리 이름 수정
    @Transactional
    public void updateCategoryName(String oldName, String newName) {
        CareerCategory category = categoryRepository.findByName(oldName);
        if (category == null) {
            throw new RuntimeException("카테고리를 찾을 수 없습니다: " + oldName);
        }
        category.setName(newName);
        categoryRepository.save(category);
    }

    // 카테고리 삭제 (비활성화)
    @Transactional
    public void deleteCategory(Long id) {
        // 카테고리 존재 여부 먼저 확인
        CareerCategory category = categoryRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("카테고리가 존재하지 않습니다: " + id));
        
        // 연관된 Career 먼저 삭제 후 카테고리 삭제
        categoryRepository.deleteCareersByCategoryId(id);
        categoryRepository.deleteCareerCategoryById(id);
    }

    // 카테고리 정보 수정
    @Transactional
    public CareerCategory updateCategory(Long id, CareerCategory categoryDetails) {
        CareerCategory category = categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("카테고리를 찾을 수 없습니다: " + id));
        
        category.setName(categoryDetails.getName());
        category.setIcon(categoryDetails.getIcon());
        category.setDisplayOrder(categoryDetails.getDisplayOrder());
        category.setIsActive(categoryDetails.getIsActive());
        
        return categoryRepository.save(category);
    }

    // 카테고리 이름으로 조회
    public CareerCategory getCategoryByName(String name) {
        return categoryRepository.findByName(name);
    }

    // 카테고리 ID로 조회
    public CareerCategory getCategoryById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("카테고리를 찾을 수 없습니다: " + id));
    }
}