package com.road.perfectpro.vo;

import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "hero_section")
@Getter
@Setter
public class HeroSection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String subtitle = "\"내 일\"이라고 생각하고 \"내 일\"처럼 하겠습니다.";
    
    @Column(nullable = false)
    private String lawyerName = "최선 변호사";
    
    @Column(nullable = false)
    private String profileImage = "/images/변호사.png";
    
    @Column(nullable = false)
    private String universityLogo = "/images/대학로고투명.png";
    
    @Column(nullable = false)
    private String companyLogo = "/images/회사로고.png";
    
    private LocalDateTime updatedAt;
}
