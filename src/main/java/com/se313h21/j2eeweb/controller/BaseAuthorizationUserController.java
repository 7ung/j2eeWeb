/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.AuthToken;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Stevie
 */
@Service
public class BaseAuthorizationUserController {
    
    @Autowired
    protected AuthToken authToken; 
    
    protected User user;
    
    protected String fetchUser(HttpServletRequest request,
            HttpServletResponse response) {
        User user = authToken.determineUser(request, response);
        ModelAndView modelAndView = new ModelAndView();
//        redir.addFlashAttribute("redirect_path", "redirect:"+request.getRequestURI());
        request.getSession().setAttribute("redirect_login", "redirect:" + request.getRequestURL());
        if (user == null){
            return "redirect:login";
        }
        else {
            request.getSession().setAttribute("user", user);
        }
        return null;
    }
    
}
