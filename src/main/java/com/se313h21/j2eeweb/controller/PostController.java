/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import java.util.ArrayList;
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
    
    @Autowired
    TagDAO tagDao;
    
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
            ModelMap model){
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String tagsListString = request.getParameter("tags-post-list");
        
        Subject subject = null;
        
        int subjectId = Integer.parseInt( request.getParameter("subject-id"));
        String subjectName = request.getParameter("subject-name");
        
        System.out.println(TAG + " subject id = " + subjectId);
        System.out.println(TAG + " subject name = " + subjectName);
        System.out.println(TAG + " tags = " + tagsListString);

        List<Tag> tags = getTagsName(tagsListString);
        
        if (subjectId != -1){
            subject = subjectDao.get(subjectId);
        }
        if (subject == null && subjectId == -1 && !subjectName.equals(""))
            subject = subjectDao.create(subjectName, "", user);

        Post post = postDao.create(title, content, user, subject, tags);
        
        model.addAttribute("message", "succes");
        return "post_create";
    }
    
    
    private List<Tag> getTagsName(String tagListString){
        List<Tag> tags = new ArrayList<>();
        String[] names = tagListString.split(";");
        Tag t = null;
        for (String name : names) {
            System.out.println(TAG + " look for tag names: " + name);
            t = tagDao.get(name);
//            if (t == null) {
//                System.out.println(TAG + " Tag not found, creeate new tag, tag names: " + name);
//                t = tagDao.create(name);
//            }
//            else {
//                System.out.println(TAG + " Tag found, tag names: " + name);
//            }
            tags.add(t);
            
        }
        return tags;
    }
    
    
    
}
