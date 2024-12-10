package com.road.perfectpro.service;

import com.road.perfectpro.vo.FAQ;
import com.road.perfectpro.repository.FAQRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FAQService {
    
    private final FAQRepository faqRepository;
    
    public List<FAQ> getAllFAQs() {
        return faqRepository.findByIsActiveTrueOrderByDisplayOrderAsc();
    }
    
    @Transactional
    public FAQ createFAQ(FAQ faq) {
        return faqRepository.save(faq);
    }
    
    @Transactional
    public FAQ updateFAQ(FAQ faq) {
        return faqRepository.save(faq);
    }
    
    @Transactional
    public void deleteFAQ(Long id) {
        faqRepository.deleteById(id);
    }
    
    public FAQ getFAQ(Long id) {
        return faqRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("FAQ를 찾을 수 없습니다."));
    }
} 