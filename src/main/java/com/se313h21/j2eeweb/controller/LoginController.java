/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.dao.AccessTokenDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.AccessTokenRepository;
import com.se313h21.j2eeweb.repositories.UserRepository;
import java.io.Console;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author Stevie
 */
@Controller
@Service
//@SessionAttributes("token")
public class LoginController extends BaseAuthorizationUserController {
    /**
     * Current account for test: 
     * jobjob - 123123
     * 123 - 123
     */
    
    @Autowired
    UserDAO userDao;
    
    @Autowired
    AccessTokenDAO accessTokenDao;
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String registration_get(
            ModelMap model){

        model.addAttribute("startPage", 0);
        return "registration";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String login(
            HttpServletRequest request,
            HttpServletResponse response, ModelMap model,
            @ModelAttribute("remember") String remember){
        
        // Lấy thông tin parse từ post params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String redirectPath = (String) request.getSession().getAttribute("redirect_login");
        
        if (userDao.get(username, password) == null){
            model.addAttribute("status", RegistrationController.eRegistrationStatus.LOGIN_FAIL);
            model.addAttribute("startPage", 0); // 1 => register;  0 => login
            return "registration";
        }
        else {
            AccessToken token = accessTokenDao.get(userDao.get());
            accessTokenDao.updateExpiredTime();
            
            userDao.updateLastLogin();
            
            if (remember.equals("on")){
                Cookie cookie = new Cookie("token", token.getAccessToken());
                cookie.setMaxAge((int) AccessTokenDAO.TOKEN_EXPIRED);
                response.addCookie(cookie);
            }
            request.getSession().setAttribute("token", token.getAccessToken());
            
            if (Strings.isNullOrEmpty(redirectPath)) {
                model.addAttribute("status", RegistrationController.eRegistrationStatus.LOGIN_SUCCESS);
                model.addAttribute("startPage", 0); // 1 => register;  0 => login
                return "registration"; 
            }
            else { 
                request.getSession().removeAttribute("redirect_login");
                return redirectPath;
            }
        }
    }
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(
            HttpServletRequest request,
            HttpServletResponse response, ModelMap model,
            @ModelAttribute("remember") String remember){
        request.getSession().removeAttribute("token");
        Cookie[] cookies = request.getCookies();
        for (Cookie ck : cookies){
            if (ck.getName().equals("token"))
                ck.setValue("");
        }
        return "index";
    }
    
    
    
   
}
