package com.road.perfectpro.vo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "expertise_details")
@Getter @Setter
public class ExpertiseDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expertise_id")
    private Expertise expertise;

    private String subtitle;        // 세부분야
    private String subtitle2;       // 진행방향

    @Column(name = "display_order")
    private Integer displayOrder;   // 표시 순서

    public Long getExpertiseId() {
        return expertise != null ? expertise.getId() : null;
    }
} 