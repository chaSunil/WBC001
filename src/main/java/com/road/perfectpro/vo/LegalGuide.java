package com.road.perfectpro.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Table(name = "legal_guides")
@Getter @Setter
public class LegalGuide {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String category;        // 뉴스, 판례리뷰 등
    private String title;          // 제목
    private String content;        // 내용
    private String source;         // 출처 (매일노동뉴스 등)
    private LocalDate date;        // 날짜
    private String link;           // 외부 링크
    private Boolean isHighlighted; // 최상단 하이라이트 여부
    private Boolean isActive;      // 활성화 여부
    private Integer displayOrder;  // 표시 순서

    @PrePersist
    public void prePersist() {
        if (isActive == null) isActive = true;
        if (isHighlighted == null) isHighlighted = false;
        if (date == null) date = LocalDate.now();
    }
}