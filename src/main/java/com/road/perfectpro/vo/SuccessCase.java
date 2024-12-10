package com.road.perfectpro.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.List;
import java.util.ArrayList;
import org.hibernate.annotations.BatchSize;

@Entity
@Table(name = "success_cases")
@Getter @Setter
@BatchSize(size = 100)
public class SuccessCase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ElementCollection
    @BatchSize(size = 100)
    @CollectionTable(name = "case_categories", joinColumns = @JoinColumn(name = "case_id"))
    @Column(name = "category")
    private List<String> categories = new ArrayList<>();  // 민사소송, 임대차분쟁 등의 카테고리들

    private String title;           // 제목
    private String content;         // 내용
    private String imageUrl;        // 이미지 URL
    private String detailLink;      // 상세 페이지 링크 (nullable)
    private String resultTitle;     // 결과 텍스트 (서브타이틀1)
    private String resultContent;   // 결과 상세 내용 (서브타이틀2)
    private Integer displayOrder;   // 표시 순서
    private Boolean isActive = true;// 활성화 여부

    @Transient  // DB에 저장하지 않음
    private String categoriesString;
    
    public String getCategoriesString() {
        return categoriesString;
    }
    
    public void setCategoriesString(String categoriesString) {
        this.categoriesString = categoriesString;
    }

    @PrePersist
    public void prePersist() {
        if (imageUrl == null || imageUrl.trim().isEmpty()) {
            imageUrl = "/images/default-case.jpg";  // 기본 이미지 경로
        }
    }
}