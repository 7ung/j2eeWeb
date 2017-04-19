/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author huynphu
 */
@Controller
@Service

public class HomeController  extends BaseAuthorizationUserController{
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        super.fetchUser(request, response);
        if (user == null) {
            return "index";
        }
        
        return "index";
    }
    
}
