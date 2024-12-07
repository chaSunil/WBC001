package com.road.perfectpro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "error", required = false) String error, 
                          Model model) {
        if (error != null) {
            model.addAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
        }
        return "login";  // src/main/webapp/WEB-INF/views/login.jsp를 찾음
    }
} 