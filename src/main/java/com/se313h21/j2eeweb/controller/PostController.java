/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.repositories.Utils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Stevie
 */
@Controller
@Service
public class PostController extends BaseAuthorizationUserController{
    
    
    @RequestMapping(value="/post", method=RequestMethod.GET)
    public String post_show(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        super.fetchUser(request, response);
        if (user == null) {
            return PostController.redirect;
        }
        
        return "post_create";
    }
    
}
