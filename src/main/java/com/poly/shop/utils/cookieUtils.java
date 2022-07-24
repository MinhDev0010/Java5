package com.poly.shop.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class cookieUtils {
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpServletResponse response;

    public String get(String name) {
        Cookie[] cookies = this.request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public Cookie add(String name, String value, int hours) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(60 * 60 * hours);
        cookie.setPath("/");
        return cookie;
    }
}
