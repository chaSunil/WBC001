package com.road.perfectpro.repository;

import com.road.perfectpro.vo.LawyerProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LawyerProfileRepository extends JpaRepository<LawyerProfile, Long> {
    @Query("SELECT p FROM LawyerProfile p LEFT JOIN FETCH p.careers ORDER BY p.id DESC")
    Optional<LawyerProfile> findFirstByOrderByIdDesc();
}