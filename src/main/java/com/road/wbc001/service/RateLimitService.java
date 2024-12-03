package com.road.wbc001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class RateLimitService {
    @Autowired
    private RedisTemplate<String, Integer> redisTemplate;
    
    private static final int MAX_EMAILS_PER_HOUR = 3;     // 시간당 최대 발송 횟수
    private static final int EXPIRE_HOURS = 24;            // 제한 시간
    private static final int MAX_FAILS_BEFORE_BLOCK = 5;  // 최대 실패 횟수
    private static final int BLOCK_HOURS = 24;            // 차단 시간
    
    public boolean tryConsume(String ipAddress) {
        // 1. IP 차단 여부 확인
        String blockKey = "block:" + ipAddress;
        Boolean isBlocked = redisTemplate.hasKey(blockKey);
        if (Boolean.TRUE.equals(isBlocked)) {
            log.warn("Blocked IP attempted access: {}", ipAddress);
            return false;
        }
        
        // 2. 시간당 요청 제한
        String limitKey = "email_limit:" + ipAddress;
        Integer count = redisTemplate.opsForValue().get(limitKey);
        
        if (count == null) {
            redisTemplate.opsForValue().set(limitKey, 1, EXPIRE_HOURS, TimeUnit.HOURS);
            return true;
        }
        
        if (count >= MAX_EMAILS_PER_HOUR) {
            // 3. 제한 초과 시 실패 카운트 증가
            String failKey = "fails:" + ipAddress;
            Long fails = redisTemplate.opsForValue().increment(failKey);
            
            if (fails >= MAX_FAILS_BEFORE_BLOCK) {
                // 4. 일정 횟수 이상 실패시 IP 차단
                redisTemplate.opsForValue().set(blockKey, 1, BLOCK_HOURS, TimeUnit.HOURS);
                log.warn("IP blocked due to multiple failures: {}", ipAddress);
            }
            
            return false;
        }
        
        redisTemplate.opsForValue().increment(limitKey);
        return true;
    }
    
    // 관리자용 차단 해제 메소드
    public void unblockIp(String ipAddress) {
        String blockKey = "block:" + ipAddress;
        String failKey = "fails:" + ipAddress;
        String limitKey = "email_limit:" + ipAddress;
        
        redisTemplate.delete(Arrays.asList(blockKey, failKey, limitKey));
        log.info("IP unblocked: {}", ipAddress);
    }
} 