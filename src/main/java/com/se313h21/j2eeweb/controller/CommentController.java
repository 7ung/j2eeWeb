/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.CommentDAO;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import java.util.Collection;
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
import sun.rmi.runtime.Log;

/**
 *
 * @author Nguyen Tan Luan
 */
@Controller
@Service
public class CommentController extends BaseAuthorizationUserController {
    
    @Autowired
    PostDAO postDao;
    
    @Autowired
    CommentDAO commentDao;
    
    @Autowired
    UserDAO userDao;
    
    @RequestMapping(value="/post-add-comment", method=RequestMethod.POST, params={"id"})
    public String comment_create(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        
        User user=super.fetchUser(request, response);
        Post post=postDao.get(postId);
        return "redirect:post?id=" + post.getId();
    }
    
    @RequestMapping(value="/post", method=RequestMethod.GET, params="{id}")
    public String comment_show(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        
        Post post=postDao.get(postId);
        
        List<Comment> comments=commentDao.getMany(post);
        if(comments.size()>8){
            comments=comments.subList(0, 8);
        }
        String message="abc";
        if(comments.isEmpty()){
            message="No comment";
        }
       
        model.addAttribute("message",message);
        model.addAttribute("comments", comments);
        model.addAttribute("post", post);
        return "post/post_comment";
        //return "redirect:post?id=" + post.getId();
    }
    
    
    
    
}
