package com.road.wbc001.dto;

import lombok.Data;

@Data
public class ConsultationRequest {
    private String name;        // 이름
    private String phone;       // 연락처
    private String email;       // 이메일
    private String message;     // 상담 내용
}