package com.road.perfectpro.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import com.road.perfectpro.repository.ExpertiseRepository;
import com.road.perfectpro.repository.ExpertiseDetailRepository;
import com.road.perfectpro.vo.Expertise;
import com.road.perfectpro.vo.ExpertiseDetail;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ExpertiseService {

    private final ExpertiseRepository expertiseRepository;
    private final ExpertiseDetailRepository detailRepository;

    public List<Expertise> getAllExpertise() {
        return expertiseRepository.findAllWithDetails();
    }

    public List<ExpertiseDetail> getDetailsForExpertise(Long expertiseId) {
        return detailRepository.findByExpertise_IdOrderByDisplayOrderAsc(expertiseId);
    }

    @Transactional
    public void saveExpertise(Expertise expertise) {
        expertiseRepository.save(expertise);
    }

    @Transactional
    public void saveDetail(ExpertiseDetail detail) {
        Expertise expertise = expertiseRepository.findById(detail.getExpertiseId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid expertise ID"));
        
        detail.setExpertise(expertise);
        detailRepository.save(detail);
    }

    @Transactional
    public void deleteExpertise(Long id) {
        expertiseRepository.deleteById(id);
    }

    @Transactional
    public void deleteDetail(Long id) {
        detailRepository.deleteById(id);
    }
} 