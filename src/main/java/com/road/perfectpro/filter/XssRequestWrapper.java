package com.road.perfectpro.filter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import java.util.regex.Pattern;

public class XssRequestWrapper extends HttpServletRequestWrapper {

    public XssRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values == null) {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = cleanXss(values[i]);
        }
        return encodedValues;
    }

    @Override
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        return value != null ? cleanXss(value) : null;
    }

    @Override
    public String getHeader(String name) {
        String value = super.getHeader(name);
        return value != null ? cleanXss(value) : null;
    }

    private String cleanXss(String value) {
        if (value == null) {
            return null;
        }
        
        // 기본 XSS 필터링
        value = value.replaceAll("(?i)<script.*?>.*?</script.*?>", "")  // <script> 태그 전체 제거
                     .replaceAll("(?i)<.*?javascript:.*?>.*?</.*?>", "") // javascript: 프로토콜 제거
                     .replaceAll("(?i)<.*?\\s+on.*?>.*?</.*?>", "");    // 이벤트 핸들러 제거
        
        // HTML 엔티티로 변환
        value = value.replaceAll("<", "&lt;")
                     .replaceAll(">", "&gt;")
                     .replaceAll("\\(", "&#40;")
                     .replaceAll("\\)", "&#41;")
                     .replaceAll("'", "&#39;")
                     .replaceAll("\"", "&quot;")
                     .replaceAll("eval\\((.*)\\)", "")
                     .replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"")
                     .replaceAll("script", "")
                     .replaceAll("alert", "")
                     .replaceAll("onload", "")
                     .replaceAll("onerror", "");
        
        return value;
    }
} 