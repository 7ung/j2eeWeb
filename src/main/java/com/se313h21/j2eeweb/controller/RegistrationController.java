/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserRole;
import com.se313h21.j2eeweb.repositories.UserRepository;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Stevie
// */
@Controller
@Service
public class RegistrationController {
    
    @Autowired(required = false)
    UserRepository repo;
    
    public enum eRegistrationStatus{
        SUCCESS (0, "Register success."), 
        USER_NAME_EMPTY (1, "Register fail!!! User name must not empty."),
        EMAIL_EMPTY (2, "Register fail!!! Email must not empty."),
        PASSWORD_EMPTY (3, "Register fail!!! Password must not empty."),
        PASSWORD_CONFIRM_NOT_MATCH (4, "Register fail!!! Password confirm doest not match."),
        USER_NAME_EXISTS (5, "Register fail!!! User name exists."),
        EMAIL_EXISTS (6, "Register fail!!! Email exists"),
        LOGIN_SUCCESS (10,"Login success"),
        LOGIN_FAIL (11, "Wrong username or password");
        private int value;
        private String message;
        
        private eRegistrationStatus(int value, String message) {
            this.value = value;
            this.message = message;
        }
        public int getValue() {
            return value;
        }
        public String getMessage(){
            return this.message;
        }
    }
    
    @RequestMapping(value="/registration", method=RequestMethod.GET)
    public String registration_get(ModelMap model){
        
        model.addAttribute("startPage", 1);
        return "registration";
    }
    
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registration_post(HttpServletRequest request,
            HttpServletResponse response, ModelMap model){
                
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        
        if (username.isEmpty()){
            model.addAttribute("status", eRegistrationStatus.USER_NAME_EMPTY);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }
        
        if (email.isEmpty()){
            model.addAttribute("status", eRegistrationStatus.EMAIL_EMPTY);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }
        
        if (password.isEmpty() || confirmPassword.isEmpty()){
            model.addAttribute("status", eRegistrationStatus.PASSWORD_EMPTY);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }

        
        if (password.equals(confirmPassword) == false){
            model.addAttribute("status", eRegistrationStatus.PASSWORD_CONFIRM_NOT_MATCH);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }        
        
        int status = 0;
        
        if (repo.findByUsername(username).isEmpty() == false){
            model.addAttribute("status", eRegistrationStatus.USER_NAME_EXISTS);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }
        
        if (repo.findByEmail(email).isEmpty() == false){
            model.addAttribute("status", eRegistrationStatus.EMAIL_EXISTS);
            model.addAttribute("startPage", 1); // 1 => register;  0 => login
            return "/registration";
        }
        
        
        String hashedPassword = Hashing.generateHash(password);
        
        User user = new User(-1, username, hashedPassword, email);
        user.setUserRoleId(new UserRole(1));
        user = repo.save(user);

        // nếu có redirect thì redirect đến trang đó.
        // todo: if redirect ...
        
        //attr.addAttribute("username", username);
        //attr.addAttribute("password", hashedPassword);
        
        model.addAttribute("defUsername", user.getUsername());
        model.addAttribute("startPage", 0); // 1 => register;  0 => login

        return "registration";
    }
    

    
}
