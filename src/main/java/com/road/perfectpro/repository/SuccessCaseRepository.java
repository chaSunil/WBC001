package com.road.perfectpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.road.perfectpro.vo.SuccessCase;
import java.util.List;

@Repository
public interface SuccessCaseRepository extends JpaRepository<SuccessCase, Long> {
    List<SuccessCase> findAllByIsActiveTrueOrderByDisplayOrderAsc();
}