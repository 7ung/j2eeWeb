/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Stevie
 */
@Controller
@Service
public class PostController extends BaseAuthorizationUserController{
    
    private static String TAG = "[PostController]:";
    
    @Autowired
    PostDAO postDao;
    
    @Autowired
    SubjectDAO subjectDao;
    
    @RequestMapping(value="/post", method=RequestMethod.GET)
    public String post_create(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        super.fetchUser(request, response);
        if (user == null) {
            return PostController.redirect;
        }
        
        List<Subject> subjects = subjectDao.getMany(user);
        model.addAttribute("subjects", subjects);
        
        
        
        return "post_create";
    }
    
    
    @RequestMapping(value = "/post", method=RequestMethod.POST)
    public String post_store(HttpServletRequest request,
            HttpServletResponse response,
//            @RequestParam(value ="us", required = false) String useSubject,
//            @RequestParam(value ="uns", required = false) String useNewSubject,
            ModelMap model){
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Subject subject = null;
        
        String[] us = request.getParameterValues("us");
        String[] uns = request.getParameterValues("uns");
        
        if (us != null && us.length >= 1 && us[0].equals("on")){
            int subjectId = Integer.parseInt( request.getParameter("subjectid"));
            subject = subjectDao.get(subjectId);
            
        }
        else if (uns != null && uns.length >= 1 && uns[0].equals("on")){
            String subjectName = request.getParameter("subject-name-new");
            subject = subjectDao.create(subjectName, "", user);
        }
        
        Post post = postDao.create(title, content, user, subject);
        model.addAttribute("message", "succes");
        return "post_create";
    }
    
    
}
