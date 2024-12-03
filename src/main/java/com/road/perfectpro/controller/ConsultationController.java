package com.road.perfectpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.road.perfectpro.dto.ConsultationRequest;
import com.road.perfectpro.service.EmailService;

import java.util.Map;

@RestController
@RequestMapping("/api/consultation")
public class ConsultationController {
    
    @Autowired
    private EmailService emailService;
    
    @PostMapping("/submit")
    public ResponseEntity<?> submitConsultation(@RequestBody ConsultationRequest request) {
        try {
            emailService.sendConsultationEmail(request);
            return ResponseEntity.ok().body(Map.of("message", "상담 신청이 완료되었습니다."));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", "상담 신청 중 오류가 발생했습니다."));
        }
    }
}
