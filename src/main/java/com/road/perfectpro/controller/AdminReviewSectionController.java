package com.road.perfectpro.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.road.perfectpro.service.ReviewSectionService;
import com.road.perfectpro.vo.ReviewSection;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminReviewSectionController {

    @Autowired
    private ReviewSectionService reviewSectionService;

    @GetMapping("/reviews")
    public String showReviews(Model model) {
        model.addAttribute("reviews", reviewSectionService.getAllReviews());
        return "admin/review-section-edit";
    }

    @PostMapping("/reviews")
    public String updateReview(@ModelAttribute("review") ReviewSection review,
                              @RequestParam(value = "profileImageFile", required = false) MultipartFile profileImage) {
        if (profileImage != null && !profileImage.isEmpty()) {
            reviewSectionService.updateReview(review, profileImage);
        } else {
            ReviewSection existingReview = reviewSectionService.getReview(review.getId());
            review.setProfileImage(existingReview.getProfileImage());
            reviewSectionService.updateReview(review, null);
        }
        return "redirect:/admin/reviews";
    }

    @PostMapping("/reviews/new")
    public String createReview(@ModelAttribute ReviewSection review,
                              @RequestParam("profileImageFile") MultipartFile profileImage) {
        reviewSectionService.createReview(review, profileImage);
        return "redirect:/admin/reviews";
    }

    @PostMapping("/reviews/delete/{id}")
    public String deleteReview(@PathVariable("id") Long id) {
        log.info("컨트롤러: 리뷰 삭제 요청 ID = {}", id);
        reviewSectionService.deleteReview(id);
        log.info("컨트롤러: 리뷰 삭제 완료");
        return "redirect:/admin/reviews";
    }
} 