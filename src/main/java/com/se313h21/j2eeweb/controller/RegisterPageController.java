/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Stevie
// */
//@Controller
//@Service
public class RegisterPageController {
    
//    @Autowired(required = false)
//    UserRepository repo;
       
//    enum eRegistrationStatus{
//        SUCCESS , 
//        USER_NAME_EXISTS,
//    }
    
//    @RequestMapping(value="/registration", method=RequestMethod.GET)
//    public String index(ModelMap model){
//        //System.out.print( model.get("username").toString());
//        int page = 1;
//        if (model.get("startPage") != null){
//            page = Integer.valueOf(model.get("startPage").toString());
//        }
//        
//        model.addAttribute("startPage", 1);
//        return "registration";
//    }
    
//    @RequestMapping(value="/registration", method=RequestMethod.POST)
//    public String postProcess(ModelMap model){
//        
//        String username = model.get("username").toString();
//        String password = model.get("password").toString();
//        String email = model.get("email").toString();
//        
//        
//        int status = 0;
//        
//        User user = repo.findByUsername(username);
//        if (user != null){
//            // người dùng đã tồn tại
//            model.addAttribute("status", eRegistrationStatus.USER_NAME_EXISTS);
//            model.addAttribute("startPage", 1); // 1 => register;  0 => login
//            return "registration";
//        }
//        else {
//            
//        }
//           
//        return "registration";
//    }
}
