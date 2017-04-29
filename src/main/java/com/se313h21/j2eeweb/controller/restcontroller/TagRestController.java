/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import java.util.ArrayList;
import java.util.List;
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
public class TagRestController {
    
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
}
