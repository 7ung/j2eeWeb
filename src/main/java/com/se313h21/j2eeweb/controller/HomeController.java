/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
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
    
    @Autowired
    SubjectDAO subjectDao;
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user != null){
            List<Subject> followedSubjects = subjectDao.getFollowedSubject(user);
            model.addAttribute("followed_subject", followedSubjects);
        }
        
        return "index";
    }
    
}
