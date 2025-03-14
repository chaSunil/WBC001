package com.road.perfectpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.road.perfectpro.dto.LawyerProfileDTO;
import com.road.perfectpro.service.CareerService;
import com.road.perfectpro.service.ExpertiseService;
import com.road.perfectpro.service.HeroSectionService;
import com.road.perfectpro.service.LawyerProfileService;
import com.road.perfectpro.service.ReviewSectionService;
import com.road.perfectpro.service.VideoSectionService;
import com.road.perfectpro.service.SuccessCaseService;
import com.road.perfectpro.service.LegalGuideService;
import com.road.perfectpro.service.FAQService;
import com.road.perfectpro.vo.Career;
import com.road.perfectpro.vo.CareerCategory;
import com.road.perfectpro.vo.Expertise;
import com.road.perfectpro.vo.ExpertiseDetail;
import com.road.perfectpro.vo.HeroSection;
import com.road.perfectpro.vo.ReviewSection;
import com.road.perfectpro.vo.VideoSection;
import com.road.perfectpro.vo.SuccessCase;
import com.road.perfectpro.vo.LegalGuide;
import com.road.perfectpro.vo.FAQ;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class HomeController {

    @Autowired
    private HeroSectionService heroSectionService;

    @Autowired
    private LawyerProfileService lawyerProfileService;

    @Autowired
    private CareerService careerService;
    
    @Autowired
    private VideoSectionService videoSectionService;
    
    @Autowired
    private ReviewSectionService reviewService;
    
    @Autowired
    private SuccessCaseService successCaseService;
    
    @Autowired
    private LegalGuideService legalGuideService;
    
    @Autowired
    private FAQService faqService;

    @Autowired
    private ExpertiseService expertiseService; 

    @GetMapping("/")
    public String home(Model model) {
        // 히어로 섹션 데이터
        HeroSection heroSection = heroSectionService.getHeroSection();
        model.addAttribute("heroSection", heroSection);

        // 변호사 프로필 데이터
        LawyerProfileDTO lawyerProfile = lawyerProfileService.getLawyerProfile();
        model.addAttribute("lawyerProfile", lawyerProfile);

        // 경력 데이터 추가
        Map<CareerCategory, List<Career>> careersByCategory = careerService.getAllCareersForAdmin();
        model.addAttribute("careersByCategory", careersByCategory);

        // 비디오 섹션 데이터
        VideoSection videoSection = videoSectionService.getVideoSection();
        model.addAttribute("videoSection", videoSection);
        
        // 리뷰 섹션 데이터
        List<ReviewSection> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        
        // 성공사례 데이터
        List<SuccessCase> cases = successCaseService.getAllActiveCases();
        model.addAttribute("successCases", cases);
        
        // 법률가이드 데이터 추가
        LegalGuide highlightedGuide = legalGuideService.getHighlightedGuide();
        List<LegalGuide> activeGuides = legalGuideService.getActiveGuides();
        model.addAttribute("highlightedGuide", highlightedGuide);
        model.addAttribute("legalGuides", activeGuides);
        
        // FAQ 데이터
        List<FAQ> faqs = faqService.getAllFAQs();
        model.addAttribute("faqs", faqs);
        
        // 전문분야 데이터
        List<Expertise> expertiseList = expertiseService.getAllExpertise();
        Map<Long, List<ExpertiseDetail>> detailsMap = new HashMap<>();
        
        for (Expertise expertise : expertiseList) {
            List<ExpertiseDetail> details = expertiseService.getDetailsForExpertise(expertise.getId());
            detailsMap.put(expertise.getId(), details);
        }
        
        model.addAttribute("expertiseList", expertiseList);
        model.addAttribute("expertiseDetails", detailsMap);
                
        return "main";
    }

    // 초대
    
    @GetMapping("/main")
    public String main(Model model) {
        // 위와 동일한 코드 반복
        return home(model);  // home 메서드 재사용
    }
}
