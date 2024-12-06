package com.road.perfectpro.repository;

import com.road.perfectpro.vo.LawyerCareer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LawyerCareerRepository extends JpaRepository<LawyerCareer, Long> {
    List<LawyerCareer> findByLawyerProfileIdOrderByDisplayOrderAsc(Long lawyerId);
}