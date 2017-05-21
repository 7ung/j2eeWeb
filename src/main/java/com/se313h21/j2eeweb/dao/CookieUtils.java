/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Stevie
 */
public class CookieUtils {
    
    /**
     * Get token từ cookie.
     * 
     * @param request pass req từ controller vào đây
     * @return 
     */
    public static String getToken(HttpServletRequest request)
    {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("token")) {
                return cookies[i].getValue();
            }
        }        
        return null;
    }
}
