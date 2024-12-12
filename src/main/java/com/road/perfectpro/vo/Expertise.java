package com.road.perfectpro.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.BatchSize;
import java.util.List;
import com.road.perfectpro.vo.ExpertiseDetail;

@Entity
@Table(name = "expertise_areas")
@Getter @Setter
public class Expertise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "icon_path")
    private String iconPath;        // 아이콘 이미지 경로

    @Column(name = "main_title")
    private String mainTitle;       // 주요 분야명

    @Column(name = "case_count")
    private Integer caseCount;      // 진행 사건 수

    @Column(name = "display_order")
    private Integer displayOrder;   // 표시 순서

    @Column(name = "is_active")
    private Boolean isActive = true;  // 활성화 여부

    @OneToMany(mappedBy = "expertise", fetch = FetchType.EAGER)
    @BatchSize(size = 100)
    @OrderBy("displayOrder ASC")
    private List<ExpertiseDetail> details;  // 세부분야 목록
} 