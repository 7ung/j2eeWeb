/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.AccessTokenDAO;
import com.se313h21.j2eeweb.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Base controller cho các lớp nào cần kiểm tra user.
 * 
 * @author Stevie
 */
@Service
public class BaseAuthorizationUserController {
    
    private static String TAG = "BaseAuthorizationUserController";
    
    @Autowired
    protected AccessTokenDAO accessTokenDao; 
    
    protected User user;
    
    protected static String redirect = "redirect:login"; 
    
    protected User fetchUser(HttpServletRequest request,
            HttpServletResponse response) {
        
        
        user = (User) request.getSession().getAttribute("user");
        
        if (user != null)
            return user;
        System.out.println(TAG + ": Not logged in. Find user from Access Token");
        user = accessTokenDao.determineUser(request, response);
        
        if (user == null){
            System.out.println(TAG + ": Can not find user from Access Token");
            request.getSession().setAttribute("redirect_login", "redirect:" + request.getRequestURL());
        }
        else {
            System.out.println(TAG + ": Found user from Access Token");
            request.getSession().setAttribute("user", user);
        }
        return user;
    }
    
}
