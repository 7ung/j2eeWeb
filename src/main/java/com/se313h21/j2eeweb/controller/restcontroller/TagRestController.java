/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.controller.BaseAuthorizationUserController;
import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import static com.se313h21.j2eeweb.model.UserSubjectBookmark_.subject;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Stevie
 */
@Service
@RestController
public class TagRestController extends BaseAuthorizationUserController{
    
    private static String TAG = TagRestController.class.getName();

    private static int ItemToSearch = 6;
    
    @Autowired
    TagDAO tagDao;
    
    @Autowired
    UserDAO userDao;
    
    @RequestMapping("/tags")
    public List<Tag> getTags(@RequestParam(value = "tags_name", defaultValue="") String name){
        System.out.println(TAG + ": tag name = " + name);
        return tagDao.getTop6(name);
        
    }

    @RequestMapping(value="/user/{id}/tags")
    public List<Tag> getTagsByUserId(
        @PathVariable("id") int userId){
        User user = userDao.get(userId);
        if (user == null)
            return new ArrayList();
        return tagDao.getMany(user);
    }
    
    @RequestMapping(value = "/tags/{id}/follow")
    public int followTag(HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("id") int tagId){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }
        
        Tag tag = tagDao.get(tagId);
        if (tag == null){
            return 404;
        }

        boolean success = tagDao.follow(tag, user.getId());
        if (success)
            return 200;
        else
            return 400;
        
    }
    
    @RequestMapping(value = "/tags/{id}/unfollow")
    public int unfollowTag(HttpServletRequest request,
        HttpServletResponse response,
        @PathVariable("id") int tagId){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }
        
        Tag tag = tagDao.get(tagId);
        if (tag == null){
            return 404;
        }

        boolean success = tagDao.unfollow(tag, user.getId());
        if (success)
            return 200;
        else
            return 400;
        
    }    
}
