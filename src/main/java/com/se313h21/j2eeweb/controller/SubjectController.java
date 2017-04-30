/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.dao.UserSubjectBookmarkDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Stevie
 */
@Controller
@Service
public class SubjectController extends BaseAuthorizationUserController {
   
    
    @Autowired
    SubjectDAO subjectDao;
    
    @Autowired
    UserSubjectBookmarkDAO usbDao;
    
    @Autowired
    PostDAO postDao;
    
    @RequestMapping(value="/subjects/{id}", method=RequestMethod.GET)
    public String subjectShow(HttpServletRequest request,
            HttpServletResponse response,
            @PathVariable(value = "id") int subjectId,            
            ModelMap model){
        User user = super.fetchUser(request, response);
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return "error_pages/404";
        
        boolean isOwner = isOwner(user, subject);
        model.addAttribute("owner", String.valueOf(isOwner));

        if (user == null){
            model.addAttribute("isFollowed", "undefined");
        }
        else {
            boolean isFollowed = usbDao.isUserFollowedPost(user, subject);
            model.addAttribute("isFollowed", String.valueOf(isFollowed));
        }
        
        List<Post> posts = postDao.get(subject);
        for(Post post : posts){
            post.setContent(""); // hide content
        }
        subject.setPostCollection(posts);
        
        model.addAttribute("subject", subject);
//        model.addAttribute("subject", subject);

        return "subject/subject_show";
    }
    
    @RequestMapping(value="/subjects", method=RequestMethod.GET)
    public String subjectCreate(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){   
        User user = super.fetchUser(request, response);
        if (user == null) {
            return SubjectController.redirect;
        }
        return "subject/subject_create";

    } 

        
    @RequestMapping(value = "/subject/{id}/follow")
    @ResponseBody
    public int followSubject(HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("id") int subjectId){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return 404;
        
        System.out.println(SubjectController.class.getSimpleName() + "@followSubject" + ": Subject found.");
        
        if (isOwner(user, subject)){
            return 409;
        }
        
        System.out.println(SubjectController.class.getSimpleName() + "@followSubject" + " Is not Owner.");
        
        boolean success = subjectDao.follow(subject, user.getId());
        if (success)
            return 200;
        else
            return 400;            
    }
    
    @RequestMapping(value = "/subject/{id}/unfollow")
    @ResponseBody    
    public int unfollowSubject(HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("id") int subjectId){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return 404;
        
        if (isOwner(user, subject)){
            return 409;
        }
        
        boolean success = subjectDao.unfollow(subject, user.getId());
        if (success)
            return 200;
        else
            return 400;            
    }    
    
    @RequestMapping(value = "/subjects/{id}/del")
    @ResponseBody
    public int deleteSubject(HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("id") int subjectId){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return 404;
        
        if (isOwner(user, subject) == false){
            return 409;
        }
        boolean success = subjectDao.delete(subject);
        if (success) 
            return 200;
        else
            return 400;
    }
    
    @RequestMapping(value = "subjects/{id}", produces="application/json;charset=UTF-8",  method=RequestMethod.POST)
    public String updateSubject(
            HttpServletRequest request,
            HttpServletResponse response,
            @PathVariable("id") int subjectId,
            @RequestParam(value="title", defaultValue="") String subjectTitle,
            @RequestParam(value="description", defaultValue="") String subjectDescription){
        
        User user = super.fetchUser(request, response);
        if (user == null) {
            return "error_pages/403";
        } 
        
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return "error_pages/404";
        
        if (isOwner(user, subject) == false){
            return "error_pages/409";
        }
        
        subject.setTitle(subjectTitle);
        subject.setDescription(subjectDescription);

        subject = subjectDao.save(subject);
        
        return "redirect:" + subject.getId();
    }    
    
    private boolean isOwner(User user, Subject subject) {
        if (user == null)
            return false;
        return Objects.equals(user.getId(), subject.getUserId().getId());        
    }
}
