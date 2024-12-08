package com.road.perfectpro.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Component
@RequiredArgsConstructor
public class RateLimitInterceptor implements HandlerInterceptor {
    private final RedisTemplate<String, Integer> redisTemplate;
    private final int MAX_REQUESTS = 30; // 최대 요청 수
    private final int TIME_WINDOW = 60; // 시간 윈도우 (초)

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ip = getClientIP(request);
        String key = "rate_limit:" + ip;
        
        Integer count = redisTemplate.opsForValue().get(key);
        
        if (count == null) {
            redisTemplate.opsForValue().set(key, 1, TIME_WINDOW, TimeUnit.SECONDS);
            return true;
        }
        
        if (count >= MAX_REQUESTS) {
            response.setStatus(HttpStatus.TOO_MANY_REQUESTS.value());
            response.setContentType("text/plain;charset=UTF-8");
            try {
                response.getWriter().write("요청이 너무 많습니다. 잠시 후 다시 시도해주세요.");
            } catch (IOException e) {
                throw new RuntimeException("응답 작성 중 오류 발생", e);
            }
            return false;
        }
        
        redisTemplate.opsForValue().increment(key);
        return true;
    }

    private String getClientIP(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
} 