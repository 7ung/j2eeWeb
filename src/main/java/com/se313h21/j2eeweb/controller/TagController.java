/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Stevie
 */
@Controller
@Service
public class TagController extends BaseAuthorizationUserController{
    
    @Autowired
    TagDAO tagDao;
    
    @Autowired
    PostDAO postDao;
    
    @RequestMapping(value = "/tags/{id}")
    public String show(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model,
            @PathVariable("id") int tagId){
        User user = super.fetchUser(request, response);
            
        Tag tag = tagDao.get(tagId);
        if (tag == null)
            return "error_pages/404";
        
        if (user == null){
            model.addAttribute("isFollowed", "undefined");
        }
        else {
            boolean isFollowed = tagDao.isUserFollowedTag(user, tag);
            model.addAttribute("isFollowed", String.valueOf(isFollowed));
        }
        
        Page<Post> posts = postDao.getManyPaging(tag);
        model.addAttribute("posts", posts);
        
        return "tag_show";
        
    }
    

}
