package com.road.perfectpro.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /img/** 요청을 /static/img/ 디렉토리의 파일로 매핑
        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/static/images/");
    }
}