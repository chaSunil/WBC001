package com.road.perfectpro.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.road.perfectpro.dto.ConsultationRequest;

@Service
@Slf4j
public class EmailService {
    
    @Autowired
    private JavaMailSender mailSender;
    
    @Value("${spring.mail.username}")
    private String senderEmail;
    
    public void sendConsultationEmail(ConsultationRequest request) {
        try {
            log.info("이메일 전송 시작");
            log.info("발신자: {}", senderEmail);
            log.info("수신자: leem91294212@gmail.com");
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            log.info("MimeMessage 생성 완료");
            
            helper.setFrom(senderEmail);
            helper.setTo("leem91294212@gmail.com");
            helper.setSubject("[법률상담] 새로운 상담 요청");
            
            String emailContent = String.format(
                "상담 요청자 정보:\n\n" +
                "이름: %s\n" +
                "연락처: %s\n" +
                "이메일: %s\n\n" +
                "상담 내용:\n%s",
                request.getName(),
                request.getPhone(),
                request.getEmail(),
                request.getMessage()
            );
            
            helper.setText(emailContent, false);
            log.info("이메일 내용 설정 완료");
            
            log.info("이메일 전송 시도...");
            mailSender.send(message);
            log.info("이메일 전송 성공");
            
        } catch (MessagingException e) {
            log.error("이메일 전송 실패: {}", e.getMessage(), e);
            throw new RuntimeException("이메일 전송 중 오류가 발생했습니다: " + e.getMessage(), e);
        } catch (Exception e) {
            log.error("예상치 못한 오류 발생: {}", e.getMessage(), e);
            throw new RuntimeException("이메일 전송 중 예상치 못한 오류가 발생했습니다: " + e.getMessage(), e);
        }
    }
}
