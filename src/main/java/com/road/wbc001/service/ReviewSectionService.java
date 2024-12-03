package com.road.wbc001.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.road.wbc001.repository.ReviewSectionRepository;
import com.road.wbc001.vo.ReviewSection;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Slf4j
@Service
@Transactional
public class ReviewSectionService {

    @Autowired
    private ReviewSectionRepository reviewSectionRepository;

    public List<ReviewSection> getAllReviews() {
        return reviewSectionRepository.findAllByOrderByDisplayOrderAsc();
    }

    public ReviewSection getReview(Long id) {
        return reviewSectionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("리뷰를 찾을 수 없습니다."));
    }

    public ReviewSection updateReview(ReviewSection review, MultipartFile profileImage) {
        ReviewSection existingReview = reviewSectionRepository.findById(review.getId())
                .orElseThrow(() -> new RuntimeException("리뷰를 찾을 수 없습니다."));
        
        existingReview.setClientName(review.getClientName());
        existingReview.setCaseType(review.getCaseType());
        existingReview.setReviewDate(review.getReviewDate());
        existingReview.setContent(review.getContent());
        existingReview.setDisplayOrder(review.getDisplayOrder());
        existingReview.setPreviewContent(review.getPreviewContent());
        existingReview.setIsActive(review.getIsActive());
        
        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveImage(profileImage);
            if (profileImagePath != null) {
                existingReview.setProfileImage(profileImagePath);
            }
        }
        
        return reviewSectionRepository.save(existingReview);
    }

    @Transactional
    public void deleteReview(Long id) {
        log.info("서비스: 리뷰 삭제 시작 ID = {}", id);
        try {
            reviewSectionRepository.deleteById(id);
            log.info("서비스: 리뷰 삭제 성공");
        } catch (Exception e) {
            log.error("서비스: 리뷰 삭제 실패", e);
            throw e;
        }
    }

    public ReviewSection createReview(ReviewSection review, MultipartFile profileImage) {
        if (profileImage != null && !profileImage.isEmpty()) {
            String profileImagePath = saveImage(profileImage);
            if (profileImagePath != null) {
                review.setProfileImage(profileImagePath);
            }
        }
        
        long count = reviewSectionRepository.count();
        if (count >= 6) {
            throw new RuntimeException("최대 6개의 리뷰만 등록할 수 있습니다.");
        }
        
        return reviewSectionRepository.save(review);
    }

    private String saveImage(MultipartFile file) {
        try {
            String uploadDir = "src/main/resources/static/images/";
            String fileName = file.getOriginalFilename();
            Path path = Paths.get(uploadDir + fileName);
            
            Files.createDirectories(path.getParent());
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            
            return "/images/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
} 