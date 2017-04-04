/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.model.Experience;
import com.se313h21.j2eeweb.repositories.AccessTokenRepository;
import com.se313h21.j2eeweb.repositories.TestRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
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
public class TestController {
    
    @Autowired(required = false)
    AccessTokenRepository repo;
   
    
    @RequestMapping(value="/test", method=RequestMethod.GET)
    public String index(
            @CookieValue(value="token", defaultValue = "") String cookieToken,
//            @ModelAttribute("token") String sessionToken,
            HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        String token = "";
        if (Strings.isNullOrEmpty(cookieToken)){
            
            token += request.getSession().getAttribute("token");

        }
        else {
            token = cookieToken;
        }
//        token = request.getAttribute("token").toString();
        
        model.addAttribute("is", Utils.isValidToken(repo, token));
        model.addAttribute("token", token);
        
        return "test";
    }
    
  
}
